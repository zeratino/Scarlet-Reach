/obj/random/loot
	var/loot_table

/obj/random/loot/Initialize()
    . = ..()
	icon_state = null
    pick_loot(loc)
    qdel(src)

/obj/random/loot/proc/pick_loot(turf/T)
	var/item_to_spawn = pickweight(loot_table)
	new item_to_spawn(get_turf(src))
	qdel(src)

/obj/random/loot/spider_cave
	loot_table = list(
		/mob/living/simple_animal/hostile/rogue/mirespider_paralytic = 10,
		/mob/living/simple_animal/hostile/retaliate/rogue/mirespider = 90
		)
