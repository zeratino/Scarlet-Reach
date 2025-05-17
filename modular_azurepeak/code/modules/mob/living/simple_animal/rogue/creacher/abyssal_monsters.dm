/mob/living/simple_animal/hostile/rogue/dreamfiend
    icon = 'modular_hearthstone/icons/mob/mirespider_big.dmi'
    name = "mire lurker"
    icon_state = "lurker"
    icon_living = "lurker"
    icon_dead = "lurker_dead"

    faction = list("zombie", "spiders")
    attack_sound = list('sound/vo/mobs/spider/attack (1).ogg','sound/vo/mobs/spider/attack (2).ogg','sound/vo/mobs/spider/attack (3).ogg','sound/vo/mobs/spider/attack (4).ogg')

    base_intents = list(/datum/intent/simple/bite/mirespider_lurker)
    butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/spider = 4,
                        /obj/item/natural/hide = 3,
                        /obj/item/natural/silk = 4, /obj/item/alch/viscera = 4)

    health = MIRESPIDER_LURKER_HEALTH
    maxHealth = MIRESPIDER_LURKER_HEALTH
    melee_damage_lower = 35
    melee_damage_upper = 70

    STACON = 9
    STASTR = 9
    STASPD = 14
    // These things will crit. Slow attacks, devestating consequences.
    STAPER = 15
    pixel_x = -4

    ai_controller = /datum/ai_controller/mirespider_lurker
    projectiletype = /obj/projectile/bullet/spider

    ranged = 1
    minimum_distance = 1
    ranged_cooldown_time = 100
    check_friendly_fire = 1
