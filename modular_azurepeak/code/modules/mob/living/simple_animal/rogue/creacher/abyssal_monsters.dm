/mob/living/simple_animal/hostile/rogue/dreamfiend
	icon = 'modular_hearthstone/icons/mob/abyssal_small.dmi'
	name = "minor dream fiend"
	icon_state = "dreamfiend"
	icon_living = "dreamfiend"
	icon_dead = "dreamfiend"

	faction = list("dream")
	attack_sound = list('sound/vo/mobs/spider/attack (1).ogg','sound/vo/mobs/spider/attack (2).ogg','sound/vo/mobs/spider/attack (3).ogg','sound/vo/mobs/spider/attack (4).ogg')

	base_intents = list(/datum/intent/simple/bite/mirespider_lurker)

	health = MIRESPIDER_LURKER_HEALTH
	maxHealth = MIRESPIDER_LURKER_HEALTH
	melee_damage_lower = 5
	melee_damage_upper = 5

	AIStatus = AI_OFF
	can_have_ai = FALSE

	ai_controller = /datum/ai_controller/assassin
	var/main_target
	var/next_blink = 0
	var/blink_cooldown = 5 SECONDS
	var/inner_tele_radius = 1
	var/outer_tele_radius = 2
	var/include_space = FALSE
	var/include_dense = FALSE
	var/include_teleport_restricted = FALSE
	var/sound1 = 'sound/magic/blink.ogg'
	var/sound2 = 'sound/magic/blink.ogg'

/mob/living/simple_animal/hostile/rogue/dreamfiend/Initialize()
	AddElement(/datum/element/ai_retaliate)
	if(main_target)
		ai_controller.set_blackboard_key(BB_MAIN_TARGET, main_target)
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
