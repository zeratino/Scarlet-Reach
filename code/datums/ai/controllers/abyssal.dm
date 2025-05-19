/datum/ai_controller/assassin
	movement_delay = MINOR_DREAMFIEND_MOVEMENT_SPEED

	planning_subtrees = list(
		/datum/ai_planning_subtree/blink_if_far,
		/datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/basic_melee_attack_subtree/abyssal
	)
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic(),
		BB_RETALIATE_ATTACKS_LEFT = 0,
		BB_BASIC_MOB_RETALIATE_LIST = list(),
		BB_RETALIATE_COOLDOWN = 0,
		BB_MAIN_TARGET = null
	)

/datum/ai_controller/assassin/ancient
	movement_delay = ANCIENT_DREAMFIEND_MOVEMENT_SPEED

	planning_subtrees = list(
		/datum/ai_planning_subtree/blink_if_far,
		/datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/basic_melee_attack_subtree/abyssal
	)
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic(),
		BB_RETALIATE_ATTACKS_LEFT = 0,
		BB_BASIC_MOB_RETALIATE_LIST = list(),
		BB_RETALIATE_COOLDOWN = 0,
		BB_MAIN_TARGET = null
	)

/datum/ai_planning_subtree/basic_melee_attack_subtree/abyssal
	melee_attack_behavior = /datum/ai_behavior/basic_melee_attack/abyssal

/datum/ai_behavior/basic_melee_attack/abyssal

/datum/ai_behavior/basic_melee_attack/abyssal/perform(delta_time, datum/ai_controller/controller, target_key, targetting_datum_key, hiding_location_key)
	var/retaliation_count = controller.blackboard[BB_RETALIATE_ATTACKS_LEFT]
	var/mob/living/simple_animal/hostile/rogue/dreamfiend/dreamfiend = controller.pawn
	to_chat(world, span_boldannounce("RETALIATION COUNT - [retaliation_count]"))

	if(retaliation_count <= 0)
		controller.set_blackboard_key(BB_RETALIATE_ATTACKS_LEFT, 2)
	if (isliving(dreamfiend))
		if (world.time < dreamfiend.melee_cooldown)
			return

	. = ..()
	//targetting datum will kill the action if not real anymore
	var/atom/target = controller.blackboard[target_key]
	var/datum/targetting_datum/targetting_datum = controller.blackboard[targetting_datum_key]

	if(!targetting_datum.can_attack(dreamfiend, target))
		finish_action(controller, FALSE, target_key)
		return

	var/hiding_target = targetting_datum.find_hidden_mobs(dreamfiend, target) //If this is valid, theyre hidden in something!

	controller.set_blackboard_key(hiding_location_key, hiding_target)

	dreamfiend.face_atom()
	dreamfiend.a_intent = pick(dreamfiend.possible_a_intents) //randomized intent
	
	if(hiding_target) //Slap it!
		dreamfiend.ClickOn(hiding_target, list())
	else
		var/current_time = world.time
		var/last_decrease = controller.blackboard[BB_RETALIATE_COOLDOWN]
		if (current_time >= last_decrease)
			controller.set_blackboard_key(BB_RETALIATE_ATTACKS_LEFT, max(retaliation_count - 1, 0))
			controller.set_blackboard_key(BB_RETALIATE_COOLDOWN, current_time + 2 SECONDS)
			to_chat(world, span_boldannounce("LOWERED AMOUNT"))
		dreamfiend.ClickOn(target, list())

	if(sidesteps_after && prob(33)) //this is so fucking hacky, but going off og code this is exactly how it goes ignoring movetimers
		if(!target || !isturf(target.loc) || !isturf(dreamfiend.loc) || dreamfiend.stat == DEAD)
			return
		var/target_dir = get_dir(dreamfiend,target)

		var/static/list/cardinal_sidestep_directions = list(-90,-45,0,45,90)
		var/static/list/diagonal_sidestep_directions = list(-45,0,45)
		var/chosen_dir = 0
		if (target_dir & (target_dir - 1))
			chosen_dir = pick(diagonal_sidestep_directions)
		else
			chosen_dir = pick(cardinal_sidestep_directions)
		if(chosen_dir)
			chosen_dir = turn(target_dir,chosen_dir)
			dreamfiend.Move(get_step(dreamfiend,chosen_dir))
			dreamfiend.face_atom(target)
		
	if(retaliation_count <= 0)
		var/main_target = controller.blackboard[BB_MAIN_TARGET]
		controller.clear_blackboard_key(BB_BASIC_MOB_RETALIATE_LIST)
		controller.set_blackboard_key(BB_BASIC_MOB_CURRENT_TARGET, main_target)
		to_chat(world, span_boldannounce("CLEARED THAT TARGET"))

/datum/ai_behavior/basic_melee_attack/finish_action(datum/ai_controller/controller, succeeded, target_key, targetting_datum_key, hiding_location_key)
	. = ..()
	if(!succeeded)
		var/mob/target = controller.blackboard[target_key]
		var/mob/main_target = controller.blackboard[BB_MAIN_TARGET]
		controller.clear_blackboard_key(target_key)
		var/mob/living/simple_animal/hostile/rogue/dreamfiend/dreamfiend = controller.pawn
		if(target != main_target && main_target.stat == 0)
			//We lost the person we really want to kill... keep trying to teleport to them and kill them.
			dreamfiend.blink_to_target(target)
			controller.set_blackboard_key(BB_BASIC_MOB_CURRENT_TARGET, main_target)
		else if(main_target.stat != 0)
			dreamfiend.return_to_abyssor()

/datum/ai_planning_subtree/blink_if_far

/datum/ai_planning_subtree/blink_if_far/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	var/mob/living/simple_animal/hostile/rogue/dreamfiend/dreamfiend = controller.pawn
	var/mob/target = controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	if(!target || get_dist(dreamfiend, target) <= 5 )
		return

	// Attempt to blink and halt further planning if successful
	if(dreamfiend.blink_to_target(target))
		return SUBTREE_RETURN_FINISH_PLANNING
