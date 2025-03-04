/datum/advclass/thug
	name = "Thug"
	tutorial = "You might not have ever been the smartest person in town. But you may have been the sturdiest. Good enough for soilers to pay you to cart around saigashit. Good enough for miners to offload some of their work to you. Good enough for a carpenter who doesnt want to pay top dollar for fine cut wood. And good enough for anyone who just wants a meathead to look scary."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/thug
	category_tags = list(CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/thug/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE) //The real purpose of thug hunting- I mean, being a thug. Killing people
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE) //I love beating people to death
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE) //Used for lumberjacking AND mining, so he's at least a LITTLE familiar with it
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE) //Used for farming tools. I figure the brute who does labor is at least passingly acquainted with improvised weapons
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE) //see above
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE) //cudgel, my beloved, my one true love. A child has a teddy bear. A thug has a cudgel.
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE) //Physically demanding job of being a meathead lunk
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE) // Dockhand work makes one acquainted with swimming when they fuck up
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/labor/mining, 1, TRUE) // No professional, but his whole shtick is unskilled physical labor, whether it be cracking skulls or stones
	H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 1, TRUE) // jaccking my schit. See above
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE) // Still farms I just moved it down here for nice formatting
	belt = /obj/item/storage/belt/rogue/leather/rope
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	backr = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	armor = /obj/item/clothing/suit/roguetown/armor/workervest
	beltr = /obj/item/rogueweapon/mace/cudgel
	beltl = /obj/item/flashlight/flare/torch
	H.change_stat("strength", 2) //This is literally the blacksmith statblock but instead of getting 1 str and 1 fortune they get 2 str
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
	H.change_stat("speed", -1)
