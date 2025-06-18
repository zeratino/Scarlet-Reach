// Steel Armor
// Iron Ingot is 20 each.
// Each Steel Ingot is 35 each, 40 minimum price.
// Cured Leather is 5 each.

/datum/supply_pack/rogue/armor_steel
	group = "Armor (Steel)"
	crate_name = "merchant guild's crate"
	mandated_public_profit = 1 // 100% Mandatory Profit Margin on top
	crate_type = /obj/structure/closet/crate/chest/merchant

// Steel Armor Section. Massive selection here so I am not going to include everything
/datum/supply_pack/rogue/armor_steel/haubergeon_steel
	name = "Haubergeon"
	cost = 40 // 1 Ingots
	contains = list(/obj/item/clothing/suit/roguetown/armor/chainmail)

/datum/supply_pack/rogue/armor_steel/hauberk_steel
	name = "Hauberk"
	cost = 70 // 2 Ingots
	contains = list(/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk)

/datum/supply_pack/rogue/armor_steel/halfplate
	name = "Half-Plate Armor"
	cost = 105 // 3 Ingots, 1 Cured Leather
	contains = list(/obj/item/clothing/suit/roguetown/armor/plate)

/datum/supply_pack/rogue/armor_steel/halfplate_fluted
	name = "Half-Plate Armor, Fluted"
	cost = 125 // 3 Ingots, 1 Iron, 1 Cured Leather
	contains = list(/obj/item/clothing/suit/roguetown/armor/plate/fluted)

/datum/supply_pack/rogue/armor_steel/fullplate
	name = "Full Plate"
	cost = 145 // 4 Steel, 1 Cured Leather 
	contains = list(/obj/item/clothing/suit/roguetown/armor/plate/full)

/datum/supply_pack/rogue/armor_steel/fullplate_fluted
	name = "Full Plate, Fluted"
	cost = 165 // 4 Steel, 1 Iron, 1 Cured Leather
	contains = list(/obj/item/clothing/suit/roguetown/armor/plate/full/fluted)

/datum/supply_pack/rogue/armor_steel/coatplates
	name = "Coat of Plates"
	cost = 75 // 2 Steel
	contains = list(/obj/item/clothing/suit/roguetown/armor/brigandine/coatplates)

/datum/supply_pack/rogue/armor_steel/cuirass_steel
	name = "Cuirass"
	cost = 70 // 2 Steel
	contains = list(/obj/item/clothing/suit/roguetown/armor/plate/half)

/datum/supply_pack/rogue/armor_steel/scalemail
	name = "Scalemail"
	cost = 70 // 2 Steel
	contains = list(/obj/item/clothing/suit/roguetown/armor/plate/scale)

/datum/supply_pack/rogue/armor_steel/brigandine
	name = "Brigandine"
	cost = 80 // 2 Steel, 2 Cloth
	contains = list(/obj/item/clothing/suit/roguetown/armor/brigandine)

/datum/supply_pack/rogue/armor_steel/chaincoif_steel
	name = "Chain Coif"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/neck/roguetown/chaincoif)

/datum/supply_pack/rogue/armor_steel/chainmantle
	name = "Chain Mantle"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/neck/roguetown/chaincoif/chainmantle)

/datum/supply_pack/rogue/armor_steel/chaingloves_steel
	name = "Gauntlets, Chain"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/gloves/roguetown/chain)

/datum/supply_pack/rogue/armor_steel/plategloves
	name = "Gauntlets, Plate"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/gloves/roguetown/plate)

/datum/supply_pack/rogue/armor_steel/chainleg_steel
	name = "Chausses, Chain"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/under/roguetown/chainlegs)

/datum/supply_pack/rogue/armor_steel/platelegs
	name = "Chausses, Plate"
	cost = 70 // 2 Steel
	contains = list(/obj/item/clothing/under/roguetown/platelegs)

/datum/supply_pack/rogue/armor_steel/bracers_plate
	name = "Bracers, Plate"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/wrists/roguetown/bracers)

/datum/supply_pack/rogue/armor_steel/helmet_nasal
	name = "Helmet, Nasal"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet)

/datum/supply_pack/rogue/armor_steel/helmet_winged
	name = "Helmet, Winged"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/winged)

/datum/supply_pack/rogue/armor_steel/helmet_kettle
	name = "Helmet, Kettle"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/kettle)

/datum/supply_pack/rogue/armor_steel/helmet_sallet
	name = "Helmet, Sallet"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/sallet)

/datum/supply_pack/rogue/armor_steel/helmet_sallet_visor
	name = "Helmet, Sallet with Visor"
	cost = 70 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/sallet/visored)

/datum/supply_pack/rogue/armor_steel/helmet_bucket
	name = "Helmet, Bucket"
	cost = 70 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/heavy/bucket)

/datum/supply_pack/rogue/armor_steel/helmet_pigface
	name = "Helmet, Pigface"
	cost = 70 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/bascinet/pigface)

/datum/supply_pack/rogue/armor_steel/helmet_hounskull
	name = "Helmet, Hounskull"
	cost = 70 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull)

/datum/supply_pack/rogue/armor_steel/helmet_bascinet
	name = "Helmet, Bascinet"
	cost = 70 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/bascinet)

/datum/supply_pack/rogue/armor_steel/helmet_etruscan_bascinet
	name = "Helmet, Etruscan Bascinet"
	cost = 70 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/bascinet/etruscan)

/datum/supply_pack/rogue/armor_steel/helmet_knight
	name = "Helmet, Knight's"
	cost = 70 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/heavy/knight)

/datum/supply_pack/rogue/armor_steel/helmet_armet
	name = "Helmet, Armet"
	cost = 70 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/heavy/knight/armet)

/datum/supply_pack/rogue/armor_steel/helmet_savoyard
	name = "Helmet, Savoyard"
	cost = 70 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/heavy/guard)

/datum/supply_pack/rogue/armor_steel/helmet_barred
	name = "Helmet, Barred"
	cost = 70 // 2 Steel
	contains = list(/obj/item/clothing/head/roguetown/helmet/heavy/sheriff)

/datum/supply_pack/rogue/armor_steel/bevor
	name = "Bevor"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/neck/roguetown/bevor)

/datum/supply_pack/rogue/armor_steel/gorget_steel
	name = "Gorget"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/neck/roguetown/gorget/steel)

/datum/supply_pack/rogue/armor_steel/boots_steel
	name = "Plated Boots"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/shoes/roguetown/boots/armor)

/datum/supply_pack/rogue/armor_steel/mask_steel
	name = "Mask"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/mask/rogue/facemask/steel)

/datum/supply_pack/rogue/armor_steel/mask_steel_hound
	name = "Mask, Hound"
	cost = 40 // 1 Steel
	contains = list(/obj/item/clothing/mask/rogue/facemask/steel/hound)

/datum/supply_pack/rogue/armor_steel/steel/belt
	name = "Belt"
	cost = 40 // 1 Steel
	contains = list(/obj/item/storage/belt/rogue/leather/steel)

/datum/supply_pack/rogue/armor_steel/steel/belt
	name = "Belt, Tasseted"
	cost = 40 // 1 Steel
	contains = list(/obj/item/storage/belt/rogue/leather/steel/tasset)
