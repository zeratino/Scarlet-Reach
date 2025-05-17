/datum/ai_controller/assassin
	planning_subtrees = list(
		/datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/basic_melee_attack_subtree/abyssal
	)
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic(),
		BB_RETALIATE_ATTACKS_LEFT = 0,
		BB_BASIC_MOB_RETALIATE_LIST = list(),
		BB_RETALIATE_COOLDOWN = 0
	)

/datum/element/ai_retaliate_limited
	var/static/list/retaliate_blackboard_keys = list(
		BB_BASIC_MOB_RETALIATE_LIST,
		BB_RETALIATE_ATTACKS_LEFT
	)

/datum/element/ai_retaliate_limited/Attach(mob/living/target)
	. = ..()
	if(!ismob(target))
		return ELEMENT_INCOMPATIBLE
	target.AddElement(/datum/element/relay_attackers)
	RegisterSignal(target, COMSIG_ATOM_WAS_ATTACKED, PROC_REF(on_attacked))

/datum/element/ai_retaliate_limited/Detach(datum/source, ...)
	. = ..()
	UnregisterSignal(source, COMSIG_ATOM_WAS_ATTACKED)

/datum/element/ai_retaliate_limited/proc/on_attacked(mob/victim, atom/attacker)
	SIGNAL_HANDLER
	victim.ai_controller?.insert_blackboard_key_lazylist(BB_BASIC_MOB_RETALIATE_LIST, attacker)

/datum/ai_planning_subtree/basic_melee_attack_subtree/abyssal
	melee_attack_behavior = /datum/ai_behavior/basic_melee_attack/abyssal

/datum/ai_behavior/basic_melee_attack/abyssal

/datum/ai_behavior/basic_melee_attack/abyssal/perform(delta_time, datum/ai_controller/controller, target_key, targetting_datum_key, hiding_location_key)
	var/retaliation_count = controller.blackboard[BB_RETALIATE_ATTACKS_LEFT]
	to_chat(world, span_boldannounce("RETALIATION COUNT - [retaliation_count]"))

	if(retaliation_count <= 0)
		controller.set_blackboard_key(BB_RETALIATE_ATTACKS_LEFT, 2)
	if (isliving(controller.pawn))
		var/mob/living/pawn = controller.pawn
		if (world.time < pawn.melee_cooldown)
			return

	. = ..()
	var/mob/living/simple_animal/basic_mob = controller.pawn
	//targetting datum will kill the action if not real anymore
	var/atom/target = controller.blackboard[target_key]
	var/datum/targetting_datum/targetting_datum = controller.blackboard[targetting_datum_key]

	if(!targetting_datum.can_attack(basic_mob, target))
		finish_action(controller, FALSE, target_key)
		return

	var/hiding_target = targetting_datum.find_hidden_mobs(basic_mob, target) //If this is valid, theyre hidden in something!

	controller.set_blackboard_key(hiding_location_key, hiding_target)

	basic_mob.face_atom()
	basic_mob.a_intent = pick(basic_mob.possible_a_intents) //randomized intent
	
	if(hiding_target) //Slap it!
		basic_mob.ClickOn(hiding_target, list())
	else
		var/current_time = world.time
		var/last_decrease = controller.blackboard[BB_RETALIATE_COOLDOWN]
		if (current_time >= last_decrease)
			controller.set_blackboard_key(BB_RETALIATE_ATTACKS_LEFT, max(retaliation_count - 1, 0))
			controller.set_blackboard_key(BB_RETALIATE_COOLDOWN, current_time + 2 SECONDS)
			to_chat(world, span_boldannounce("LOWERED AMOUNT"))
		basic_mob.ClickOn(target, list())

	if(sidesteps_after && prob(33)) //this is so fucking hacky, but going off og code this is exactly how it goes ignoring movetimers
		if(!target || !isturf(target.loc) || !isturf(basic_mob.loc) || basic_mob.stat == DEAD)
			return
		var/target_dir = get_dir(basic_mob,target)

		var/static/list/cardinal_sidestep_directions = list(-90,-45,0,45,90)
		var/static/list/diagonal_sidestep_directions = list(-45,0,45)
		var/chosen_dir = 0
		if (target_dir & (target_dir - 1))
			chosen_dir = pick(diagonal_sidestep_directions)
		else
			chosen_dir = pick(cardinal_sidestep_directions)
		if(chosen_dir)
			chosen_dir = turn(target_dir,chosen_dir)
			basic_mob.Move(get_step(basic_mob,chosen_dir))
			basic_mob.face_atom(target)
		
	if(retaliation_count <= 0)
		controller.clear_blackboard_key(BB_BASIC_MOB_RETALIATE_LIST)
		controller.clear_blackboard_key(BB_BASIC_MOB_CURRENT_TARGET)
		to_chat(world, span_boldannounce("CLEARED THAT TARGET"))

