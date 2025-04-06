/mob/living/simple_animal/hostile/boss/fishboss
	name = "Deep One Duke"
	desc = ""
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	boss_abilities = list(/datum/action/boss/lich_summon_minions)
	faction = list("deepone")
	del_on_death = TRUE
	icon = 'icons/roguetown/mob/monster/pufferboss.dmi'
	icon_state = "pufferman"
	wander = 0
	vision_range = 16
	aggro_vision_range = 24
	ranged = 1
	rapid = 4
	rapid_fire_delay = 8
	ranged_message = "spits stones"
	ranged_cooldown_time = 40
	ranged_ignores_vision = TRUE
	environment_smash = 0
	minimum_distance = 8
	retreat_distance = 0
	move_to_delay = 10
	obj_damage = 100
	base_intents = list(/datum/intent/simple/claw/deepone_boss)
	melee_damage_lower = 65
	melee_damage_upper = 90
	health = 4500
	maxHealth = 4500
	STASTR = 18
	STAPER = 15
	STAINT = 12
	STACON = 20
	STAEND = 20
	STASPD = 15
	STALUC = 14
	projectiletype = /obj/projectile/bullet/reusable/deepone
	projectilesound = 'sound/combat/wooshes/punch/punchwoosh (1).ogg'
	patron = /datum/patron/divine/abyssor
	stat_attack = UNCONSCIOUS
	var/minions_to_spawn = 17
	var/next_summon = 0
	var/list/minions = list(
		/mob/living/simple_animal/hostile/rogue/deepone = 40,
		/mob/living/simple_animal/hostile/rogue/deepone/spit = 30,
		/mob/living/simple_animal/hostile/rogue/deepone/arm = 20,
		/mob/living/simple_animal/hostile/rogue/deepone/wiz = 20)
	
	
//stolen from lich code
/datum/action/boss/fishboss_summon
	name = "Summon Minions"
	button_icon_state = "art_summon"
	usage_probability = 100
	boss_cost = 70
	boss_type = /mob/living/simple_animal/hostile/retaliate/rogue/boss/lich
	needs_target = TRUE
	say_when_triggered = "Ggglg- ♐︎◆︎♋︎❒︎♑︎'♎︎□︎♓︎♑︎!"
	var/static/summoned_minions = 0

/datum/action/boss/fishboss_summon/Trigger()
	if(summoned_minions <= 8 && ..())
		var/list/minions = list(
		/mob/living/carbon/human/species/skeleton/npc/dungeon/lich = 30)
		var/list/directions = GLOB.cardinals.Copy()
		for(var/i in 1 to 2)
			var/minions_chosen = pickweight(minions)
			new minions_chosen (get_step(boss,pick_n_take(directions)), 1)
		summoned_minions += 1;

