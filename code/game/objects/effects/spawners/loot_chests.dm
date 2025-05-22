/*
* these chests roll a semi-randomized number of loot objects from their tables. based on paxilloot ฅ^•ﻌ•^ฅ
* you can mix and match lootspawners but the dice roll will spawn from each in the list. meaning if your loot_weighted_list
* has lots of entries the loot_spawn_dice_string should be small or you'll create giant client murdering piles of stuff
*/

/obj/structure/closet/crate/chest/loot_chest
	storage_capacity = 100
	anchored = TRUE
	/// our lootspawners. the spawner's lootcount var works additively with our dice string below and must be at least 1.
	var/list/loot_weighted_list = list(
		/obj/effect/spawner/lootdrop/roguetown/dungeon = 1,
	)
	/// a string of dice to use when rolling number of contents.
	var/loot_spawn_dice_string = "1d4+1"

/obj/structure/closet/crate/chest/loot_chest/Initialize()
	. = ..()
	var/random_loot_amount = roll(loot_spawn_dice_string)
	for(var/loot_spawn in 1 to random_loot_amount)
		var/obj/new_loot = pick(loot_weighted_list)
		new new_loot(src)

/obj/structure/closet/crate/chest/loot_chest/locked
	locked = TRUE
	max_integrity = 1000
	loot_weighted_list = list(
		/obj/effect/spawner/lootdrop/valuable_jewelry_spawner = 1,
	)
	loot_spawn_dice_string = "1d2"

/obj/structure/closet/crate/chest/loot_chest/locked/indestructible //party up with rogues NOW
	max_integrity = INFINITY
	lock_strength = 200
