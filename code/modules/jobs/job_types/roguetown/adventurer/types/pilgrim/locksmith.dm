/datum/advclass/locksmith
	name = "Locksmith"
	tutorial = "Although a set of lockpicks typically means a bad actor, there are genuine reasons to have one, and your career is one of those reasons. You're no artificer, and certainly no blacksmith, but you know the fineries of metal work when it comes to small mechanical contraptions."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/thug
	category_tags = list(CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/thug/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE) //you ever use a knife as a screwdriver or prybar? ye...
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE) //hammer dat metal in2 place
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE) //Meant to be the sneaky sneak badguy...
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE) //even the cheesemaker gets athletics
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 4, TRUE) //With leeway to actually just be a genuine tradesman
	H.mind.adjust_skillrank(/datum/skill/craft/engineering, 1, TRUE) //Only need lvl 1 to make locks and keys, we dont want to dimish the actual artificer, they get cucked enough as is
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	belt = /obj/item/storage/belt/rogue/leather/rope
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	backr = /obj/item/storage/backpack/rogue/satchel
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid //Learned profession, makes sense they'd have some actual money
	mouth = /obj/item/rogueweapon/huntingknife
	beltr = /obj/item/rogueweapon/hammer/claw
	beltl = /obj/item/rogueweapon/tongs
	backpack_contents = list(/obj/item/lockpickring/mundane = 1)
	H.change_stat("intelligence", 1) //overall +5 to stats, nowhere near as good as miner or other towners, but not as ass as comically ass as thug used to be
	H.change_stat("perception", 2) 
	H.change_stat("speed", 2)
