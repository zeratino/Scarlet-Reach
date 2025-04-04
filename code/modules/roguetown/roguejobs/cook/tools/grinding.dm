/obj/structure/fluff/millstone
	name = "millstone"
	desc = "A millstone used to grind grain into flour."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "millstone"
	density = TRUE
	anchored = TRUE
	blade_dulling = DULLING_BASH
	max_integrity = 400
	var/list/obj/item/to_grind = list()
	var/flour_grindtime = 3 SECONDS
	var/stone_grindtime = 1 SECONDS // Just a define, it shouldn't scale to cooking skills since there's negative scaling for no skills

/obj/structure/fluff/millstone/attackby(obj/item/W, mob/living/user, params)
	var/datum/skill/craft/cooking/cs = user?.mind?.get_skill_level(/datum/skill/craft/cooking)
	flour_grindtime = initial(flour_grindtime) / get_cooktime_divisor(cs)
	if(istype(W, /obj/item/reagent_containers/food/snacks))
		var/obj/item/reagent_containers/food/snacks/S = W
		if(S.mill_result)
			playsound(get_turf(user), 'modular/Neu_Food/sound/milling.ogg', 100, TRUE, -1)
			if(do_after(user, flour_grindtime, target = src))
				new S.mill_result(get_turf(loc))
				qdel(S)
			return
	if(istype(W, /obj/item/natural/stone))
		playsound(get_turf(user), 'modular/Neu_Food/sound/milling.ogg', 100, TRUE, -1)
		if(do_after(user, stone_grindtime, target = src))
			new /obj/item/reagent_containers/powder/mineral(get_turf(loc))
			qdel(W)
		return
	if(istype(W, /obj/item/reagent_containers/powder/coarse_salt))
		playsound(get_turf(user), 'modular/Neu_Food/sound/milling.ogg', 100, TRUE, -1)
		if(do_after(user, stone_grindtime, target = src))
			new /obj/item/reagent_containers/powder/salt(get_turf(loc))
			qdel(W)
		return
	..()
