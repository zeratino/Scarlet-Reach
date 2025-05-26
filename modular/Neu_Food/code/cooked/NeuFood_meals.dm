/* * * * * * * * * * * **
 *						*
 *		 NeuFood		*	- Defined as edible food that can be plated and usually needs rare tools or ingridients. Typically based on a snack but not necessarily
 *		 (Meals)		*
 *						*
 * * * * * * * * * * * **/



/*	..................   Pepper steak   ................... */
/obj/item/reagent_containers/food/snacks/rogue/peppersteak
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("steak" = 1, "pepper" = 1)
	name = "peppersteak"
	desc = "Roasted flesh flanked with a generous coating of ground pepper for intense flavor."
	faretype = FARE_FINE
	portable = FALSE
	icon_state = "peppersteak"
	foodtype = MEAT
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/foodbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'

/*	..................   Onion steak   ................... */
/obj/item/reagent_containers/food/snacks/rogue/onionsteak
	name = "onion steak"
	desc = "Roasted flesh garnished with tender fried onions. Fragrant and slathered with juices of both ingredients to a perfect mouth-watering sauce."
	icon_state = "onionsteak"
	tastes = list("steak" = 1, "onions" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS)
	foodtype = MEAT
	faretype = FARE_NEUTRAL
	portable = FALSE
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/foodbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	

/obj/item/reagent_containers/food/snacks/rogue/onionsteak/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(!experimental_inhand)
		return
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/carrot_baked))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,3 SECONDS, target = src))
				user.mind.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/steakcarrotonion(loc)
				qdel(I)
				qdel(src)
	else
		return ..()

/*	..................   Carrot Steak   ................... */
/obj/item/reagent_containers/food/snacks/rogue/carrotsteak
	name = "carrot steak"
	desc = "Roasted flesh paired with savory baked carrot. Fragrant and slathered with juices of both ingredients to a perfect mouth-watering sauce."
	icon_state = "carrotsteak"
	tastes = list("steak" = 1, "carrot" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT+3)
	foodtype = MEAT
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/foodbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'

/obj/item/reagent_containers/food/snacks/rogue/carrotsteak/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(!experimental_inhand)
		return
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/onion_fried))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,3 SECONDS, target = src))
				user.mind.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/steakcarrotonion(loc)
				qdel(I)
				qdel(src)
	else
		return ..()

/*	.................   Steak & carrot & onion   ................... */
/obj/item/reagent_containers/food/snacks/rogue/steakcarrotonion
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("steak" = 1, "onion" = 1, "carrots" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT+3)
	name = "steak meal"
	desc = ""
	icon_state = "steakmeal"
	foodtype = VEGETABLES | MEAT
	warming = 3 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/foodbuff

/*	.................   Wiener Cabbage   ................... */
/obj/item/reagent_containers/food/snacks/rogue/wienercabbage
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("savory sausage" = 1, "cabbage" = 1)
	name = "wiener on cabbage"
	desc = "A rich and heavy meal, a perfect ration for a soldier on the march."
	faretype = FARE_NEUTRAL
	portable = FALSE
	icon_state = "wienercabbage"
	foodtype = VEGETABLES | MEAT
	warming = 3 MINUTES
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff
	

/*	.................   Wiener & Fried potato   ................... */
/obj/item/reagent_containers/food/snacks/rogue/wienerpotato
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("savory sausage" = 1, "potato" = 1)
	name = "wiener on tato"
	desc = "Stout and nourishing."
	faretype = FARE_NEUTRAL
	portable = FALSE
	icon_state = "wienerpotato"
	foodtype = VEGETABLES | MEAT
	warming = 3 MINUTES
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff
	

/obj/item/reagent_containers/food/snacks/rogue/wienerpotato/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(!experimental_inhand)
		return
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/onion_fried))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,3 SECONDS, target = src))
				add_sleep_experience(user, /datum/skill/craft/cooking, user.STAINT)
				new /obj/item/reagent_containers/food/snacks/rogue/wienerpotatonions(loc)
				qdel(I)
				qdel(src)
	else
		return ..()

/*	.................   Wiener & Fried onions   ................... */
/obj/item/reagent_containers/food/snacks/rogue/wieneronions
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("savory sausage" = 1, "fried onions" = 1)
	name = "wiener and onions"
	desc = "Stout and flavourful."
	faretype = FARE_NEUTRAL
	portable = FALSE
	icon_state = "wieneronion"
	foodtype = VEGETABLES | MEAT
	warming = 3 MINUTES
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff
	

/obj/item/reagent_containers/food/snacks/rogue/wieneronions/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(!experimental_inhand)
		return
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/potato_baked))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,3 SECONDS, target = src))
				add_sleep_experience(user, /datum/skill/craft/cooking, user.STAINT)
				new /obj/item/reagent_containers/food/snacks/rogue/wienerpotatonions(loc)
				qdel(I)
				qdel(src)
	else
		return ..()

/*	.................   Wiener & potato & onions   ................... */
/obj/item/reagent_containers/food/snacks/rogue/wienerpotatonions
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("savory sausage" = 1, "potato" = 1)
	name = "wiener meal"
	desc = "Stout and nourishing."
	faretype = FARE_NEUTRAL
	portable = FALSE
	icon_state = "wpotonion"
	foodtype = VEGETABLES | MEAT
	warming = 3 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/foodbuff

/*	.................   Frybird & Tato   ................... */
/obj/item/reagent_containers/food/snacks/rogue/frybirdtato
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("frybird" = 1, "tato" = 1)
	name = "frybird with a tato"
	desc = "Hearty, comforting and rich - Alleged favorite dish of Ravox."
	faretype = FARE_FINE
	portable = FALSE
	icon_state = "frybirdtato"
	foodtype = VEGETABLES | MEAT
	warming = 3 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/foodbuff
	

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

/*	.................   Chicken roast   ................... */
/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked
	desc = "A plump bird, roasted to a perfect temperature and bears a crispy skin."
	eat_effect = null
	slices_num = 0
	name = "roast bird"
	icon_state = "roastchicken"
	faretype = FARE_FINE
	portable = FALSE
	tastes = list("tasty birdmeat" = 1)
	cooked_type = null
	bonus_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	rotprocess = SHELFLIFE_DECENT
	

/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked/attackby(obj/item/I, mob/user, params)
	var/obj/item/reagent_containers/peppermill/mill = I
	if(istype(mill))
		if (!isturf(src.loc) || \
			!(locate(/obj/structure/table) in src.loc) && \
			!(locate(/obj/structure/table/optable) in src.loc) && \
			!(locate(/obj/item/storage/bag/tray) in src.loc))
			to_chat(user, span_warning("I need to use a table."))
			return FALSE

		if(!mill.reagents.has_reagent(/datum/reagent/consumable/blackpepper, 1))
			to_chat(user, "There's not enough black pepper to make anything with.")
			return FALSE

		mill.icon_state = "peppermill_grind"
		to_chat(user, "You start rubbing the bird roast with black pepper.")
		playsound(get_turf(user), 'modular/Neu_Food/sound/peppermill.ogg', 100, TRUE, -1)
		if(do_after(user,3 SECONDS, target = src))
			mill.icon_state = "peppermill"
			if(!mill.reagents.has_reagent(/datum/reagent/consumable/blackpepper, 1))
				to_chat(user, "There's not enough black pepper to make anything with.")
				return FALSE

			mill.reagents.remove_reagent(/datum/reagent/consumable/blackpepper, 1)
			new /obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked/spiced(loc)
			qdel(src)
		else
			mill.icon_state = "peppermill"
	else
		return ..()

/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked/spiced
	desc = "A plump bird, roasted perfection, spiced to taste divine."
	eat_effect = /datum/status_effect/buff/foodbuff
	name = "spiced bird-roast"
	faretype = FARE_LAVISH
	portable = FALSE
	color = "#ffc0c0"
	tastes = list("spicy birdmeat" = 1)

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
