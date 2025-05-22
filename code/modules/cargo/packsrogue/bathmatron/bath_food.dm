/* 
 * Bathhouse Food Pack
 * In a certain country in our world, there are massage spas that offer legitimate massages. Fruits are often served in lobbies alongside drinks like boba tea or milk tea.
 * Sometimes there's an in built buffet or an attached restaurant. For the full on relaxation experience. I haven't seen anyone feed the fruits to customers. 
 * That's probably because I was going to the legit and legal one. Therefore, adding a small selection of food to the bathhouse is a sovlful idea.
 * Also there's sources that food were actually served in bathhouses even directly over the bathtub on serving tray and therefore this is historically accurate.
 * Also these are overpriced
*/
/datum/supply_pack/rogue/bath_food
	group = "Exotic Food"
	crate_name = "bathmatron's crate"
	crate_type = /obj/structure/closet/crate/chest/merchant

/datum/supply_pack/rogue/bath_food/aged_cheese
	name = "Aged Cheese Wheel"
	cost = 50
	contains = list (/obj/item/reagent_containers/food/snacks/rogue/cheddar/aged)

/datum/supply_pack/rogue/bath_food/ranesheni_cake
	name = "Ranesheni Cake"
	cost = 50
	contains = list (/obj/item/reagent_containers/food/snacks/rogue/hcake)

/datum/supply_pack/rogue/bath_food/cheesecake
	name = "Cheesecake"
	cost = 50
	contains = list (/obj/item/reagent_containers/food/snacks/rogue/ccake)

/datum/supply_pack/rogue/bath_food/jackberries
	name = "Jackberries"
	cost = 20
	contains = list (
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue,
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue,
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue,
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue,
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue,
	)

// Same as merchant
/datum/supply_pack/rogue/bath_food/honey
	name = "Honey"
	cost = 40
	contains = list(
					/obj/item/reagent_containers/food/snacks/rogue/honey,
					/obj/item/reagent_containers/food/snacks/rogue/honey,
					/obj/item/reagent_containers/food/snacks/rogue/honey,
				)

// I just thought it would be funny to have butter
/datum/supply_pack/rogue/bath_food/butter
	name = "Butter"
	cost = 35
	contains = list(
					/obj/item/reagent_containers/food/snacks/butter,
					/obj/item/reagent_containers/food/snacks/butter,
					/obj/item/reagent_containers/food/snacks/butter,
				)
