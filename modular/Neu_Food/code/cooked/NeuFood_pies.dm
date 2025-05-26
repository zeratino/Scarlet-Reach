/* * * * * * * * * * * **
 *						*
 *		 NeuFood		*
 *		 (Pies)		 	*
 *						*
 * * * * * * * * * * * **/

/*	........   Pie templates   ................ */


// -------------- HANDPIE (dwarven pie on the go, good shelflife until bitten, made from pie dough and mince, truffles or jacksberries) -----------------
/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw
	name = "raw handpie"
	desc = "The dwarven take on pies, called pierogi in their dialect. A fistfull of food to stand the test of time."
	icon_state = "handpie_raw"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/handpie
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/handpie
	w_class = WEIGHT_CLASS_NORMAL
	dropshrink = 0.8

/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/mushroom
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | VEGETABLES
	tastes = list("mushrooms" = 1)

/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/mince
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | MEAT
	tastes = list("meat" = 1)
	
/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/berry
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | FRUIT
	tastes = list("berry" = 1)

/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/poison
	list_reagents = list(/datum/reagent/berrypoison = 5)
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | FRUIT
	tastes = list("bitter berry" = 1)

/obj/item/reagent_containers/food/snacks/rogue/handpie
	name = "handpie"
	desc = "The dwarven take on pies, called pierogi in their dialect. A fistfull of food to stand the test of time."
	icon_state = "handpie"
	eat_effect = /datum/status_effect/buff/foodbuff
	bitesize = 4
	faretype = FARE_FINE
	bonus_reagents = list(/datum/reagent/consumable/nutriment = BUTTERDOUGHSLICE_NUTRITION+MINCE_NUTRITION)
	tastes = list("crispy dough" = 1)
	rotprocess = null
	dropshrink = 0.8

/obj/item/reagent_containers/food/snacks/rogue/handpie/On_Consume(mob/living/eater)
	..()
	icon_state = "handpie[bitecount]"
	if(bitecount == 1)
		rotprocess = SHELFLIFE_DECENT
		addtimer(CALLBACK(src, PROC_REF(begin_rotting)), 20, TIMER_CLIENT_TIME)

// ---------------- CRAB CAKE -------------------------- //

/obj/item/reagent_containers/food/snacks/rogue/foodbase/crabcakeraw
	name = "raw crab cake"
	desc = "A variant of the handpie filled with buttery, savory shellfish meat and made with a buttered slice of dough."
	icon_state = "crab_cake_raw"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/crabcake
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/crabcake
	cooked_smell = /datum/pollutant/food/pie_base
	w_class = WEIGHT_CLASS_NORMAL
	dropshrink = 0.8

/obj/item/reagent_containers/food/snacks/rogue/crabcake
	name = "crab cake"
	desc = "A variant of the handpie filled with buttery, savory shellfish meat and made with a buttered slice of dough."
	icon_state = "crab_cake"
	eat_effect = /datum/status_effect/buff/foodbuff
	bitesize = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = SMALLDOUGH_NUTRITION + MEATSLAB_NUTRITION)
	tastes = list("crispy butterdough and shellfish meat" = 1)
	rotprocess = null
	dropshrink = 0.8
