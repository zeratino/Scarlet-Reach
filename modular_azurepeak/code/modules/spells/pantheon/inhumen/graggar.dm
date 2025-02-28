//Dirty Fighting - POCKET SAND!!!!
/obj/effect/proc_holder/spell/invoked/projectile/pocket_sand
	name = "Dirty Fighting"
	desc = "Graggar cares not for the rules of battle, merely the slaughter of it. Blind your target, throw forth a cocktail of sediment into your enemy's eyes!"
	clothes_req = FALSE
	range = 3	//It's literally pocket sand.
	associated_skill = /datum/skill/magic/arcane
	projectile_type = /obj/projectile/magic/pocket_sand
	chargedloop = /datum/looping_sound/invokeholy
	releasedrain = 30
	chargedrain = 0
	chargetime = 15
	charge_max = 10 SECONDS
	invocation = "A BLINDED LITTLE LAMB, HAHAHA!"

/obj/projectile/magic/pocket_sand
	name = "unholy sand"
	icon_state = "spark"
	damage = 5	//Sand ouchie.
	damage_type = BRUTE
	nodamage = FALSE

/obj/projectile/magic/pocket_sand/on_hit(target, mob/living/M)
	if(!istype(M))
		return
	if(target)
		M.blind_eyes(2)
		M.blur_eyes(5)
		to_chat(target, span_warning("Gah! Sand in my eyes!"))

//Call to Slaughter - AoE buff for all people surrounding you.
/obj/effect/proc_holder/spell/self/call_to_slaughter
	name = "Call to Slaughter"
	desc = "Grants you and all allies nearby a buff to their strength, endurance, and constitution."
	overlay_state = "call_to_slaughter"
	charge_max = 5 MINUTES
	invocation = "LAMBS TO THE SLAUGHTER!"
	invocation_type = "shout"
	sound = 'sound/magic/timestop.ogg'
	releasedrain = 30
	miracle = TRUE
	devotion_cost = 40

/obj/effect/proc_holder/spell/self/call_to_slaughter/cast(list/targets,mob/living/user = usr)
	for(var/mob/living/carbon/target in view(3, get_turf(user)))
		if(istype(target.patron, /datum/patron/inhumen))
			target.apply_status_effect(/datum/status_effect/buff/call_to_slaughter)	//Buffs inhumens
			return
		if(istype(target.patron, /datum/patron/old_god))
			to_chat(target, span_danger("You feel a surge of cold wash over you; leaving your body as quick as it hit.."))	//No effect on Psydonians!
			return
		if(!user.faction_check_mob(target))
			continue
		if(target.mob_biotypes & MOB_UNDEAD)
			continue
		target.apply_status_effect(/datum/status_effect/debuff/call_to_slaughter)
	return ..()

//Unholy Grasp - Throws disappearing net made of viscera at enemy. Creates blood on impact.
/obj/effect/proc_holder/spell/invoked/projectile/blood_net
	name = "Unholy Grasp"
	desc = "Toss forth an unholy snare of blood and guts a short distance, summoned from your leftover trophies sacrificed to Graggar. Like a net, may it snare your target!"
	clothes_req = FALSE
	overlay_state = "unholy_grasp"
	range = 3	//It's a net, so low range.
	associated_skill = /datum/skill/magic/arcane
	projectile_type = /obj/projectile/magic/unholy_grasp
	chargedloop = /datum/looping_sound/invokeholy
	releasedrain = 30
	chargedrain = 0
	chargetime = 15
	charge_max = 10 SECONDS

/obj/projectile/magic/unholy_grasp
	name = "viceral organ net"
	icon_state = "tentacle_end"
	nodamage = TRUE	//No damage, just ensnaring a target.

/obj/projectile/magic/unholy_grasp/on_hit(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(..() || !iscarbon(hit_atom))//if it gets caught or the target can't be cuffed,
		return//abort
	ensnare(hit_atom)

/obj/projectile/magic/unholy_grasp/proc/ensnare(mob/living/carbon/C)
	if(!C.legcuffed && C.get_num_legs(FALSE) >= 2)
		visible_message("<span class='danger'>\The [src] ensnares [C] in vicera!</span>")
		C.legcuffed = src
		forceMove(C)
		C.update_inv_legcuffed()
		SSblackbox.record_feedback("tally", "handcuffs", 1, type)
		to_chat(C, "<span class='danger'>\The [src] ensnares you!</span>")
		C.Knockdown(knockdown)
		C.apply_status_effect(/datum/status_effect/debuff/netted)
		playsound(src, 'sound/combat/caught.ogg', 50, TRUE)

//Revel in Slaughter - Self-healing by consuming blood around you; large healing, has delay though.
/obj/effect/proc_holder/spell/self/revel_in_slaughter
	name = "Revel in Slaughter"
	desc = "The blood of your enemy rejuvinates you, Gaggar's gifts fusing your blood with the blood around you."
	overlay_state = "bloodsteal"
	charge_max = 5 MINUTES
	invocation = "MURDER REJUNVIATES!"
	invocation_type = "shout"
	sound = 'sound/magic/unmagnet.ogg'
	releasedrain = 30
	miracle = TRUE
	devotion_cost = 70

/obj/effect/proc_holder/spell/self/revel_in_slaughter/cast(atom/A, mob/living/user = usr)
	for(var/obj/effect/decal/cleanable/blood/B in view(3, user))
		var/turf/open/T = A
		for(var/obj/effect/decal/cleanable/blood/target in T)
			qdel(target)
	user.adjustBruteLoss(-50)
	user.adjustFireLoss(-50)
