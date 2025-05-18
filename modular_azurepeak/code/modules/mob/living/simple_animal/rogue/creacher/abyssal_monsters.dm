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

/mob/living/simple_animal/hostile/rogue/dreamfiend/Initialize()
    AddElement(/datum/element/ai_retaliate)
    . = ..()
