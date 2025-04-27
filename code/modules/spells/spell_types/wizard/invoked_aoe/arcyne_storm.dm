// Adjusted from Vanderlin / Hearthstone balance to 8 seconds, 3 tiles
/obj/effect/proc_holder/spell/invoked/arcyne_storm
	name = "Arcyne Storm"
	desc = "Conjure ripples of force into existance over a 7x7 area every second for 8 seconds, injuring any who enter"
	cost = 2
	releasedrain = 50
	chargedrain = 1
	chargetime = 12 SECONDS
	recharge_time = 50 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	spell_tier = 3 // AOE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	gesture_required = TRUE // Offensive spell
	invocation = "Procella Arcana!"
	invocation_type = "shout"
	glow_color = GLOW_COLOR_ARCANE
	invocation_type = "shout"
	overlay_state = "hierophant"
	ignore_los = FALSE
	var/aoe_range = 3 // Adjusted from 4 to 3 tiles so mage cannot rip everyone apart in an event
	var/damage = 10

/obj/effect/proc_holder/spell/invoked/arcyne_storm/cast(list/targets, mob/user = usr)
	var/turf/T = get_turf(targets[1])
	var/list/affected_turfs = list()

	var/turf/source_turf = get_turf(user)
	if(T.z > user.z)
		source_turf = get_step_multiz(source_turf, UP)
	if(T.z < user.z)
		source_turf = get_step_multiz(source_turf, DOWN)

	for(var/turf/turfs_in_range in view(aoe_range, T))
		if(!(turfs_in_range in view(source_turf)))
			continue
		affected_turfs.Add(turfs_in_range)
		new /obj/effect/temp_visual/trap/arcyne_storm(turfs_in_range)
	for(var/i = 1, i < 9, i++)
		addtimer(CALLBACK(src, PROC_REF(apply_damage), affected_turfs, user), wait = i * 1 SECONDS)
	return TRUE

/obj/effect/proc_holder/spell/invoked/arcyne_storm/proc/apply_damage(list/affected_turfs, mob/user)
	for(var/turf/damage_turf in affected_turfs)
		new /obj/effect/temp_visual/arcyne_storm_squares(damage_turf)
		for(var/mob/living/L in damage_turf.contents)
			if(L.anti_magic_check())
				visible_message(span_warning("The magic fades away around you [L] "))  //antimagic needs some testing
				playsound(get_turf(L), 'sound/magic/magic_nulled.ogg', 100)
				return
			L.adjustBruteLoss(damage)
			playsound(damage_turf, "genslash", 40, TRUE)
			to_chat(L, span_userdanger("I'm cut by arcyne force!"))	

/obj/effect/temp_visual/trap/arcyne_storm
	duration = 1 SECONDS

/obj/effect/temp_visual/arcyne_storm_squares
	name = "vortex energy"
	layer = MASSIVE_OBJ_LAYER
	icon_state = "hierophant_squares"
	duration = 3
	light_outer_range = 2
	light_color = COLOR_PALE_PURPLE_GRAY
	randomdir = FALSE
