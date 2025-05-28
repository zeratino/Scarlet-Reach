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
