#define STATE_SAFE 			0
#define STATE_MARTYR		1
#define STATE_MARTYRULT		2

/datum/component/martyrweapon
	var/list/allowed_areas = list(/area/rogue/indoors/town/church, /area/rogue/indoors/town/church/chapel)
	var/list/allowed_patrons = list()
	var/cooldown = 30 SECONDS
	var/last_activation = 0
	var/next_activation = 0
	var/end_activation = 0
	var/ignite_chance = 10
	var/traits_applied = list(TRAIT_NOPAIN, TRAIT_NOPAINSTUN, TRAIT_CRITICAL_RESISTANCE, TRAIT_NOMOOD, TRAIT_NOHUNGER, TRAIT_EASYDISMEMBER)
	var/stat_bonus_martyr = 2
	var/mob/current_holder
	var/is_active = FALSE
	var/allow_all = FALSE
	var/is_activating
	var/current_state = STATE_SAFE
	var/martyr_duration = 6 MINUTES
	var/safe_duration = 9 MINUTES
	var/ultimate_duration = 2 MINUTES
	var/last_pulse = 0
	var/last_time

/datum/component/martyrweapon/Initialize()
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(on_equip))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(on_drop))
	RegisterSignal(parent, COMSIG_ITEM_AFTERATTACK, PROC_REF(item_afterattack))
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine))
	START_PROCESSING(SSdcs, src)

/datum/component/martyrweapon/process()
	if(is_active)
		if(world.time > end_activation)
			handle_end()
		else
			var/timer = timehint()
			switch(current_state)
				if(STATE_SAFE)
					return
				if(STATE_MARTYR)
					if(last_pulse != timer && timer != 0)
						trigger_pulse()
						last_pulse = timer
				if(STATE_MARTYRULT)
					var/timeult = round((world.time / 10) / 30)
					if(timeult == 1)	//10 seconds
						trigger_pulse(range = 4, isfinal = TRUE)
					else if(timeult % 2 == 0)
						trigger_pulse()


/datum/component/martyrweapon/proc/handle_end()
	deactivate()
	switch(current_state)
		if(STATE_SAFE)
			var/area/A = get_area(current_holder)
			var/success = FALSE
			for(var/AR in allowed_areas)
				if(istype(A, AR))
					success = TRUE
					break
			if(success)
				to_chat(span_notice("The weapon fizzles out, its energies dissipating across the holy grounds."))
			else
				to_chat(span_notice("The weapon begins to fizzle out, but the energy has nowhere to go!"))
				var/mob/living/carbon/C = current_holder
				C.freak_out()
				if(prob(35))
					killhost()
		if(STATE_MARTYR)
			killhost()

		if(STATE_MARTYRULT)
			killhost()

/datum/component/martyrweapon/proc/killhost()
	var/mob/living/carbon/human/H = current_holder
	H.apply_damage(1000, OXY)
	H.apply_damage(1000, TOX)
	H.apply_damage(1000, BRUTE)
	H.apply_damage(1000, BURN)
	H.apply_damage(1000, BRAIN)
	H.apply_damage(1000, CLONE)

/datum/component/martyrweapon/proc/trigger_pulse(range = 2, isfinal = FALSE)
	for(var/mob/M in oviewers(range, current_holder))
		mob_ignite(M)
		if(isfinal)
			if(ishuman(M))
				var/mob/living/carbon/human/H
				var/type = H.patron?.type
				if(istype(type, /datum/patron/inhumen))
					H.electrocution_animation(20)


/datum/component/martyrweapon/proc/timehint()
	var/result = round((end_activation - world.time) / 600)	// Minutes
	if(result != last_time)
		to_chat(current_holder,span_notice("[result + 1] minutes left."))
		last_time = result
		return result
	if(result == 0)
		var/resultadv = (end_activation - world.time) / 10	//Seconds
		if(resultadv < 30 && resultadv > 25 && last_time != 30)
			to_chat(current_holder,span_notice("30 SECONDS!"))
			last_time = 30
		else
			if(resultadv == 10 && last_time != 10)
				to_chat(current_holder,span_crit("10 SECONDS"))
				last_time = resultadv
	return 0

/datum/component/martyrweapon/proc/item_afterattack(obj/item/source, atom/target, mob/user, proximity_flag, click_parameters)
	if(is_active && proximity_flag)
		if(isobj(target))
			target.spark_act()
			target.fire_act()
		else if(isliving(target))
			var/mob/living/M = target
			switch(current_state)
				if(STATE_SAFE)
					return
				if(STATE_MARTYR)
					if(prob(ignite_chance))
						mob_ignite(M)
				if(STATE_MARTYRULT)
					mob_ignite(M)
		else
			return
	else
		return

/datum/component/martyrweapon/proc/mob_ignite(mob/target)
	if(isliving(target))
		var/mob/living/M = target
		M.adjust_fire_stacks(5)
		M.IgniteMob()

/datum/component/martyrweapon/proc/on_equip(datum/source, mob/user, slot)
	if(!allow_all)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			if(HAS_TRAIT(user, TRAIT_ROTMAN) || HAS_TRAIT(user, TRAIT_NOBREATH))	//Can't be a Martyr if you're undead already.
				to_chat(H, span_warn("It burns and sizzles! It does not tolerate my pallid flesh!"))
				H.dropItemToGround(parent)
				return
			var/datum/job/J = SSjob.GetJob(H.mind?.assigned_role)
			if(!J.title == "Martyr" && !J.title == "Priest")		//Can't be a Martyr if you're not a Martyr. Or a Priest.
				to_chat(H, span_warn("It slips from my grasp. I can't get a hold."))
				H.dropItemToGround(parent)
				return
			else
				RegisterSignal(user, COMSIG_CLICK_ALT, PROC_REF(altclick))
				current_holder = user
	else
		RegisterSignal(user, COMSIG_CLICK_ALT, PROC_REF(altclick))
		current_holder = user

/datum/component/martyrweapon/proc/altclick(mob/user)
	if(user == current_holder && !is_active && !is_activating)
		if(world.time > next_activation)
			if(!allow_all)
				var/A = get_area(user)
				if(A)
					var/area/testarea = A
					var/success = FALSE
					for(var/AR in allowed_areas)
						if(istype(testarea, AR))
							success = TRUE
							break
					if(success)
						if(alert("You are within holy grounds. Do you wish to call your god to aid in its defense? (You will live if the duration ends within the Church.)", "Your Oath", "Yes", "No") == "Yes")
							is_activating = TRUE
							activate(user, STATE_SAFE)
					else
						if(alert("You are trying to activate the weapon outside of holy grounds. Do you wish to fulfill your Oath of Vengeance? (You will die.)", "Your Oath", "Yes", "No") == "Yes")
							var/choice = alert("You pray to your god. How many minutes will you ask for? (Shorter length means greater boons)","Your Oath (It is up to you if your death is canon)", "Six", "Two", "Nevermind")
							switch(choice)
								if("Six")
									is_activating = TRUE
									activate(user, STATE_MARTYR)
								if("Two")
									is_activating = TRUE
									activate(user, STATE_MARTYRULT)
								if("Nevermind")
									to_chat(user, "You reconsider. It is not the right moment.")
									return
			else
				activate(user)

/datum/component/martyrweapon/proc/on_drop(datum/source, mob/user)
	UnregisterSignal(user, COMSIG_CLICK_ALT)
	deactivate()

/datum/component/martyrweapon/proc/on_examine(datum/source, mob/user, list/examine_list)
	if(current_holder)
		examine_list += span_notice("It looks to be bound.")
	if(!is_active && world.time < last_activation)
		var/time = last_activation - world.time
		time = time / 10	//Deciseconds to seconds
		examine_list += span_notice("The time remaininng until it is prepared: [time] seconds.")
	if(is_active)
		examine_list += span_warningbig("It is lit afire by godly energies!")
		if(user == current_holder)
			examine_list += span_warningbig("<i>SLAY THE HERETICS! TAKE THEM WITH YOU!</i>")

/datum/component/martyrweapon/proc/adjust_traits(remove = FALSE)
	for(var/trait in traits_applied)
		if(!remove)
			ADD_TRAIT(current_holder, trait, TRAIT_GENERIC)
		else
			REMOVE_TRAIT(current_holder, trait, TRAIT_GENERIC)

/datum/component/martyrweapon/proc/deactivate()
	var/obj/item/I = parent
	if(HAS_TRAIT(parent, TRAIT_NODROP))
		REMOVE_TRAIT(parent, TRAIT_NODROP, TRAIT_GENERIC)
	is_active = FALSE
	I.damtype = BRUTE
	adjust_traits(remove = TRUE)
	adjust_icons(tonormal = TRUE)

/datum/component/martyrweapon/proc/flash_lightning(mob/user)
	for(var/mob/living/carbon/M in viewers(world.view, user))
		M.lightning_flashing = TRUE
		M.update_sight()
		addtimer(CALLBACK(M, TYPE_PROC_REF(/mob/living/carbon, reset_lightning)), 2)
	var/turf/T = get_step(get_step(user, NORTH), NORTH)
	T.Beam(user, icon_state="lightning[rand(1,12)]", time = 5)
	playsound(user, 'sound/magic/lightning.ogg', 100, FALSE)

/datum/component/martyrweapon/proc/adjust_icons(tonormal = FALSE)
	var/obj/item/I = parent
	if(!tonormal)
		I.toggle_state = "[I.icon_state]_on"
		I.item_state = "[I.toggle_state]"
		I.icon_state = "[I.toggle_state]"
	else
		I.icon_state = initial(I.icon_state)
		I.item_state = initial(I.item_state)
		I.toggle_state = null
	
	current_holder.regenerate_icons()

/datum/component/martyrweapon/proc/activate(mob/user, status_flag)
	current_holder.visible_message("[span_notice("[current_holder] begins invoking their Oath!")]", span_notice("You begin to invoke your oath."))
	user.playsound_local(user, 'sound/misc/martyrcharge.ogg', 100, FALSE)
	if(do_after(user, 50))
		flash_lightning(user)
		var/obj/item/I = parent
		I.damtype = BURN

		adjust_icons()
		ADD_TRAIT(parent, TRAIT_NODROP, TRAIT_GENERIC)

		last_activation = world.time
		next_activation = last_activation + cooldown

		if(status_flag)
			current_state = status_flag
		switch(current_state)
			if(STATE_SAFE)
				end_activation = world.time + safe_duration
			if(STATE_MARTYR)
				end_activation = world.time + martyr_duration
			if(STATE_MARTYRULT)
				end_activation = world.time + ultimate_duration
			else
				end_activation = world.time + safe_duration

		if(ishuman(current_holder))
			var/mob/living/carbon/human/H = current_holder
			H.cmode_music = 'sound/music/combat_martyr.ogg'
			SEND_SOUND(H, sound(null))
			adjust_traits(remove = FALSE)
			if(!H.cmode)
				H.toggle_cmode()
			else
				H.toggle_cmode()
				H.toggle_cmode()

		is_activating = FALSE
		is_active = TRUE
	else
		is_activating = FALSE
		SEND_SOUND(current_holder, sound(null))

/obj/item/rogueweapon/sword/long/martyr
	force = 27
	force_wielded = 32
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/sword/strike, /datum/intent/sword/chop)
	icon_state = "martyrsword"
	icon = 'icons/roguetown/weapons/64.dmi'
	item_state = "martyrsword"
	lefthand_file = 'icons/mob/inhands/weapons/roguemartyr_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/roguemartyr_righthand.dmi'
	name = "martyr sword"
	desc = "A bastard sword that can chop with ease."
	parrysound = "bladedmedium"
	swingsound = BLADEWOOSH_LARGE
	pickup_sound = 'sound/foley/equip/swordlarge2.ogg'
	bigboy = 1
	wlength = WLENGTH_LONG
	gripsprite = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	associated_skill = /datum/skill/combat/swords
	throwforce = 15
	thrown_bclass = BCLASS_CUT
	dropshrink = 0.75
	smeltresult = /obj/item/ingot/silver
	is_silver = TRUE
	toggle_state = null

/obj/item/rogueweapon/sword/long/martyr/Initialize()
	AddComponent(/datum/component/martyrweapon)
	..()

/obj/item/clothing/cloak/martyr
	name = "martyr cloak"
	desc = "A long vest meant for knights."
	color = null
	icon_state = "martyrcloak"
	item_state = "martyrcloak"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	body_parts_covered = CHEST|GROIN
	boobed = FALSE
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	flags_inv = HIDECROTCH|HIDEBOOB
