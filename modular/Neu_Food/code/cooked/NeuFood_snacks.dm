/* * * * * * * * * * * **
 *						*
 *		 NeuFood		*	- Defined as edible food that can't be plated and ideally can be made in rough conditions, generally less nutritious
 *		 (Snacks)		*
 *						*
 * * * * * * * * * * * **/

/*	.............   Fried egg   ................ */
/obj/item/reagent_containers/food/snacks/rogue/friedegg
	trash = null
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("fried egg" = 1)
	name = "fried egg"
	desc = "A favorite dish among Astratans."
	icon_state = "friedegg"
	portable = FALSE
	faretype = FARE_POOR
	foodtype = MEAT
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/friedegg/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	update_cooktime(user)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/friedegg))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,short_cooktime, target = src))
				add_sleep_experience(user, /datum/skill/craft/cooking, user.STAINT)
				new /obj/item/reagent_containers/food/snacks/rogue/friedegg/two(loc)
				qdel(I)
				qdel(src)
	else
		return ..()


/*	.............   Twin fried cackleberries   ................ */
/obj/item/reagent_containers/food/snacks/rogue/friedegg/two
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS)
	tastes = list("fried cackleberries" = 1)
	name = "fried cackleberries"
	faretype = FARE_NEUTRAL
	desc = "Double the yolks, double the fun."
	portable = FALSE
	icon_state = "seggs"

/obj/item/reagent_containers/food/snacks/rogue/friedegg/two/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	update_cooktime(user)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheddarwedge))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,long_cooktime, target = src))
				add_sleep_experience(user, /datum/skill/craft/cooking, user.STAINT)
				new /obj/item/reagent_containers/food/snacks/rogue/friedegg/tiberian(loc)
				qdel(I)
				qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/bacon/fried))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,long_cooktime, target = src))
				user.mind.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/friedegg/bacon(loc)
				qdel(I)
				qdel(src)
	else
		return ..()

/*	.............   Deviled Eggs   ................ */
/obj/item/reagent_containers/food/snacks/rogue/stuffeggraw
	name = "raw stuffed egg"
	desc = ""
	icon_state = "deviledegg_raw"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/preserved/stuffegg
	foodtype = MEAT
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/preserved/stuffegg
	tastes = list("creamy cheese" = 1, "egg" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	name = "stuffed egg"
	desc = ""
	icon_state = "deviledegg"
	foodtype = MEAT
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT


