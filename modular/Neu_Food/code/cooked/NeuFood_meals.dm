/* * * * * * * * * * * **
 *						*
 *		 NeuFood		*	- Defined as edible food that can be plated and usually needs rare tools or ingridients. Typically based on a snack but not necessarily
 *		 (Meals)		*
 *						*
 * * * * * * * * * * * **/

/*	.................   Valerian Omelette   ................... */
/obj/item/reagent_containers/food/snacks/rogue/friedegg/tiberian
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("fried cackleberries" = 1, "cheese" = 1)
	name = "valerian omelette"
	desc = "Fried cackleberries on a bed of half-melted cheese, a dish from distant lands."
	faretype = FARE_FINE
	portable = FALSE
	icon_state = "omelette"
	eat_effect = /datum/status_effect/buff/foodbuff
	rotprocess = SHELFLIFE_DECENT

/*	.................   Bacon & Eggs   ................... */
/obj/item/reagent_containers/food/snacks/rogue/friedegg/bacon
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("fried cackleberries" = 1, "bacon" = 1)
	name = "bacon and cackleberries"
	desc = ""
	icon_state = "baconegg"
	eat_effect = /datum/status_effect/buff/foodbuff
	rotprocess = SHELFLIFE_DECENT

/*	.................   Rice & pork  ................... */
/obj/item/reagent_containers/food/snacks/rogue/ricepork
	name = "rice and pork"
	tastes = list("rice" = 1, "pork" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	desc = ""
	icon_state = "ricepork"
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff

/obj/item/reagent_containers/food/snacks/rogue/ricepork/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(!experimental_inhand)
		return
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/veg/cucumber_sliced))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,3 SECONDS, target = src))
				user.mind.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/riceporkcuc(loc)
				qdel(I)
				qdel(src)
	else
		return ..()

/*	.................   Rice & pork & cucumbers ................... */
/obj/item/reagent_containers/food/snacks/rogue/riceporkcuc
	name = "rice and pork meal"
	tastes = list("rice" = 1, "pork" = 1, "fresh cucumber")
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	desc = ""
	icon_state = "riceporkmeal"
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff

/*	.................   Rice & beef ................... */
/obj/item/reagent_containers/food/snacks/rogue/ricebeef
	name = "rice and beef"
	tastes = list("rice" = 1, "steak" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	desc = ""
	icon_state = "ricebeef"
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff

/obj/item/reagent_containers/food/snacks/rogue/ricebeef/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(!experimental_inhand)
		return
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/carrot_baked))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,3 SECONDS, target = src))
				user.mind.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/ricebeefcar(loc)
				qdel(I)
				qdel(src)
	else
		return ..()

/*	.................   Rice & beef & carrots ................... */
/obj/item/reagent_containers/food/snacks/rogue/ricebeefcar
	name = "rice and beef meal"
	tastes = list("rice" = 1, "steak" = 1, "carrot")
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	desc = ""
	icon_state = "ricebeefmeal"
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff
