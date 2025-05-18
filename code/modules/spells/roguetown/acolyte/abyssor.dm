//t1, the bends
/obj/effect/proc_holder/spell/invoked/abyssor_bends
	name = "Depth Bends"
	overlay_state = "thebends"
	releasedrain = 15
	chargedrain = 0
	chargetime = 2 SECONDS
	range = 15
	movement_interrupt = FALSE
	chargedloop = null
	sound = 'sound/foley/bubb (5).ogg'
	invocation = "Weight of the deep, crush!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 20 SECONDS
	miracle = TRUE
	devotion_cost = 15

/obj/effect/proc_holder/spell/invoked/abyssor_bends/cast(list/targets, mob/user = usr)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		user.visible_message("<font color='yellow'>[user] makes a fist at [target]!</font>")
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		if(istype(target, /mob/living/carbon))
			var/mob/living/carbon = target
			carbon.adjustStaminaLoss(125)
		target.Dizzy(10)
		target.blur_eyes(20)
		target.emote("drown")
		return TRUE
	revert_cast()
	return FALSE
//T2, Abyssal Healing. Totally stole most of this from lesser heal.
/obj/effect/proc_holder/spell/invoked/abyssheal
	name = "Abyssal Healing"
	overlay_state = "thebends"
	releasedrain = 15
	chargedrain = 0
	chargetime = 1 SECONDS
	range = 2
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/foley/waterenter.ogg'
	invocation = "Healing waters, come forth!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 10 SECONDS
	miracle = TRUE
	devotion_cost = 50

/obj/effect/proc_holder/spell/invoked/abyssheal/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(user.patron?.undead_hater && (target.mob_biotypes & MOB_UNDEAD)) //THE DEEP CALLS- sorry, the pressure of the deep falls upon those of the undead ilk
			target.visible_message(span_danger("[target] is crushed by divine pressure!"), span_userdanger("I'm crushed by divine pressure!"))
			target.adjustBruteLoss(30)			
			return TRUE
		var/conditional_buff = FALSE
		var/situational_bonus = 1
		target.visible_message(span_info("A wave of divine energy crashes over [target]!"), span_notice("I'm crushed by healing energies!"))
		var/list/water = list(/turf/open/water/bath, /turf/open/water/ocean, /turf/open/water/cleanshallow, /turf/open/water/swamp, /turf/open/water/swamp/deep, /turf/open/water/pond, /turf/open/water/river)
		situational_bonus = 0
		// the more warter around us, the more we heal
		for (var/turf/O in oview(3, user))
			if (O in water)
				situational_bonus = min(situational_bonus + 0.1, 2)
		for (var/turf/open/water/ocean/deep/O in oview(3, user))
			situational_bonus += 0.5
		// Healing by the deep sea gives an extra boost.
		if (situational_bonus > 0)
			conditional_buff = TRUE
		var/healing = 6.5
		target.adjustFireLoss(-80)
		if (conditional_buff)
			to_chat(user, "Calling upon Abyssor's power is easier in these conditions!")
			healing += situational_bonus
			target.adjustFireLoss(-40)
		target.apply_status_effect(/datum/status_effect/buff/healing, healing)
		return TRUE
	revert_cast()
	return FALSE
//t3 alt, land surf, i just removed it but if this idea is like better... we'll see

//t3, possible t4 if I put in land surf, summon mossback
/obj/effect/proc_holder/spell/invoked/call_mossback
	name = "Call Mossback"
	overlay_state = "thebends"
	range = 7
	no_early_release = TRUE
	charging_slowdown = 1
	releasedrain = 20
	chargedrain = 0
	chargetime = 2 SECONDS
	chargedloop = null
	sound = 'sound/foley/bubb (1).ogg'
	invocation = "From the abyss, rise!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 180 SECONDS
	miracle = TRUE
	devotion_cost = 100
	var/townercrab = TRUE //I was looking at this for three days and i am utterly stupid for not fixing it

/obj/effect/proc_holder/spell/invoked/call_mossback/cast(list/targets, mob/living/user)
	. = ..()
	var/turf/T = get_turf(targets[1])
	if(isopenturf(T))
		if(!user.mind.has_spell(/obj/effect/proc_holder/spell/invoked/minion_order))
			user.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/minion_order)
		new /mob/living/simple_animal/hostile/retaliate/rogue/mossback(T, user, townercrab)
		return TRUE
	else
		to_chat(user, span_warning("The targeted location is blocked. My call fails to draw a mossback."))
		return FALSE

/obj/effect/proc_holder/spell/invoked/call_dreamfiend
	name = "Summon Dreamfiend"
	overlay_state = "thebends"
	range = 7
	no_early_release = TRUE
	charging_slowdown = 1
	chargetime = 2 SECONDS
	sound = 'sound/foley/bubb (1).ogg'
	invocation = "From the dream, consume!"
	invocation_type = "shout"
	recharge_time = 300 SECONDS
	miracle = TRUE
	devotion_cost = 150

	// Teleport parameters
	var/inner_tele_radius = 1
	var/outer_tele_radius = 2
	var/include_dense = FALSE
	var/include_teleport_restricted = FALSE

/obj/effect/proc_holder/spell/invoked/call_dreamfiend/cast(list/targets, mob/living/user)
	. = ..()
	var/mob/living/carbon/target = targets[1]
	
	if(!istype(target))
		to_chat(user, span_warning("This spell only works on creatures capable of dreaming!"))
		revert_cast()
		return FALSE

	var/turf/target_turf = get_turf(target)
	var/list/turfs = list()

	// Reused turf selection logic from blink_to_target
	for(var/turf/T in range(target_turf, outer_tele_radius))
		if(T in range(target_turf, inner_tele_radius))
			continue
		if(istransparentturf(T))
			continue
		if(T.density && !include_dense)
			continue
		if(T.teleport_restricted && !include_teleport_restricted)
			continue
		if(T.x>world.maxx-outer_tele_radius || T.x<outer_tele_radius)
			continue
		if(T.y>world.maxy-outer_tele_radius || T.y<outer_tele_radius)
			continue
		turfs += T

	if(!length(turfs))
		for(var/turf/T in orange(target_turf, outer_tele_radius))
			if(!(T in orange(target_turf, inner_tele_radius)))
				turfs += T

	if(!length(turfs))
		to_chat(user, span_warning("No valid space to manifest the dreamfiend!"))
		revert_cast()
		return FALSE

	var/turf/spawn_turf = pick(turfs)
	
	var/mob/living/simple_animal/hostile/rogue/dreamfiend/F = new(spawn_turf)
	F.ai_controller.set_blackboard_key(BB_BASIC_MOB_CURRENT_TARGET, target)
	F.ai_controller.set_blackboard_key(BB_MAIN_TARGET, target)
	
	F.visible_message(span_notice("A [F] manifests following after [target]... countless teeth bared with hostility!"))
	return TRUE
