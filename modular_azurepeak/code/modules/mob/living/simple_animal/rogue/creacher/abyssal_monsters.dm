/mob/living/simple_animal/hostile/rogue/dreamfiend
	icon = 'modular_hearthstone/icons/mob/abyssal_small.dmi'
	name = "minor dream fiend"
	icon_state = "dreamfiend"
	icon_living = "dreamfiend"
	icon_dead = "dreamfiend"

	//Not a crab, but mossbacks respect other creations of Abyssor...
	faction = list("dream", "crabs")
	attack_sound = list('sound/vo/mobs/spider/attack (1).ogg','sound/vo/mobs/spider/attack (2).ogg','sound/vo/mobs/spider/attack (3).ogg','sound/vo/mobs/spider/attack (4).ogg')

	base_intents = list(/datum/intent/simple/bite)

	health = MINOR_DREAMFIEND_HEALTH
	maxHealth = MINOR_DREAMFIEND_HEALTH
	melee_damage_lower = 25
	melee_damage_upper = 40

	AIStatus = AI_OFF
	can_have_ai = FALSE

	ai_controller = /datum/ai_controller/assassin
	melee_cooldown = MINOR_DREAMFIEND_ATTACK_SPEED
	var/next_blink = 0
	var/blink_cooldown = 5 SECONDS
	var/inner_tele_radius = 1
	var/outer_tele_radius = 2
	var/include_dense = FALSE
	var/include_teleport_restricted = FALSE
	var/sound1 = 'sound/magic/blink.ogg'
	var/sound2 = 'sound/magic/blink.ogg'

/mob/living/simple_animal/hostile/rogue/dreamfiend/major
	icon = 'modular_hearthstone/icons/mob/abyssal_medium.dmi'
	name = "major dream fiend"
	pixel_x = -4

	health = MAJOR_DREAMFIEND_HEALTH
	maxHealth = MAJOR_DREAMFIEND_HEALTH
	melee_damage_lower = 50
	melee_damage_upper = 90
	melee_cooldown = MAJOR_DREAMFIEND_ATTACK_SPEED

/mob/living/simple_animal/hostile/rogue/dreamfiend/ancient
	icon = 'modular_hearthstone/icons/mob/abyssal_large.dmi'
	name = "ancient dream fiend"
	desc = "A truly horrifying creature. It makes you dizzy just looking at it."
	pixel_x = -16

	health = ANCIENT_DREAMFIEND_HEALTH
	maxHealth = ANCIENT_DREAMFIEND_HEALTH
	melee_damage_lower = 40
	melee_damage_upper = 120
	base_intents = list(/datum/intent/simple/dreamfiend_ancient)
	melee_cooldown = ANCIENT_DREAMFIEND_ATTACK_SPEED

	ai_controller = /datum/ai_controller/assassin/ancient

/mob/living/simple_animal/hostile/rogue/dreamfiend/Initialize()
	AddElement(/datum/element/ai_retaliate)
	. = ..()

/mob/living/simple_animal/hostile/rogue/dreamfiend/proc/blink_to_target(var/mob/target)
	to_chat(world, span_boldannounce("BLINKY TIME YIPPEE"))
	if(world.time < next_blink || QDELETED(target) || target.stat == DEAD)
		return FALSE

	var/turf/target_turf = get_turf(target)
	var/list/turfs = list()

	for(var/turf/T in range(target,outer_tele_radius))
		if(T in range(target,inner_tele_radius))
			continue
		if(istransparentturf(T))
			continue
		if(T.density && !include_dense)
			continue
		if(T.teleport_restricted && !include_teleport_restricted)
			continue
		if(T.x>world.maxx-outer_tele_radius || T.x<outer_tele_radius)
			continue	//putting them at the edge is dumb
		if(T.y>world.maxy-outer_tele_radius || T.y<outer_tele_radius)
			continue
		turfs += T

	if(!length(turfs))
		for(var/turf/T in orange(target_turf, outer_tele_radius))
			if(!(T in orange(target_turf, inner_tele_radius)))
				turfs += T

	if(!length(turfs))
		return FALSE

	var/turf/tele_turf = pick(turfs)
	playsound(src, sound1, 50, TRUE)
	new /obj/effect/temp_visual/decoy(loc, src)

	if(do_teleport(src, tele_turf, forceMove = TRUE, channel = TELEPORT_CHANNEL_MAGIC))
		playsound(tele_turf, sound2, 50, TRUE)
		next_blink = world.time + blink_cooldown
		return TRUE

	return FALSE

/mob/living/simple_animal/hostile/rogue/dreamfiend/proc/return_to_abyssor()
	src.visible_message(span_notice("The [src] starts to fade out of reality!"))
	if(do_after(src, 8 SECONDS, FALSE))
		qdel(src)

/mob/living/simple_animal/hostile/rogue/dreamfiend/death(gibbed)
	..()
	if(prob(5))
		new /obj/item/roguegem/yellow(loc)
	//Was it even real?!
	new /obj/effect/decal/cleanable/dreamfiend_ichor(loc)
	qdel(src)

/mob/living/simple_animal/hostile/rogue/dreamfiend/major/death(gibbed)
	..()
	if(prob(1))
		new /obj/item/rogueweapon/greataxe/dreamscape(loc)
	new /obj/effect/decal/cleanable/dreamfiend_ichor/large(loc)
	qdel(src)

/mob/living/simple_animal/hostile/rogue/dreamfiend/ancient/death(gibbed)
	..()
	if(prob(50))
		if(prob(1))
			new /obj/item/rogueweapon/greataxe/dreamscape/active(loc)
		else
			new /obj/item/rogueweapon/greataxe/dreamscape(loc)
	new /obj/effect/decal/cleanable/dreamfiend_ichor/huge(loc)
	qdel(src)

/obj/effect/decal/cleanable/dreamfiend_ichor
	name = "vile ichor"
	desc = "this dark shifting liquid looks impossibly deep"
	icon = 'modular_hearthstone/icons/mob/abyssal_small.dmi'
	icon_state = "dreamfiend_dead"
	beauty = -100
	alpha = 200
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = NO_CLIENT_COLOR

/obj/effect/decal/cleanable/dreamfiend_ichor/large
	pixel_x = -4
	icon = 'modular_hearthstone/icons/mob/abyssal_medium.dmi'

/obj/effect/decal/cleanable/dreamfiend_ichor/huge
	pixel_x = -16
	icon = 'modular_hearthstone/icons/mob/abyssal_large.dmi'

/datum/intent/simple/dreamfiend_ancient
	name = "devestating bite"
	icon_state = "inchop"
	attack_verb = list("eviscerates", "tears at")
	animname = "cut"
	blade_class = BCLASS_CHOP
	hitsound = list('sound/combat/hits/bladed/genchop (1).ogg', 'sound/combat/hits/bladed/genchop (2).ogg', 'sound/combat/hits/bladed/genchop (3).ogg')
	penfactor = 30

/mob/living/simple_animal/hostile/rogue/dreamfiend/ancient/AttackingTarget()
	. = ..()
	if(. && isliving(target))
		var/mob/living/L = target
		if(L.reagents)
			L.reagents.add_reagent(/datum/reagent/toxin/venom, 1)
