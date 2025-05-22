/*
* map spawners which represent different tiers of what you might find in fantasy dungeons ฅ^•ﻌ•^ฅ
*/

// this set is general spawners that have a little bit of everything

/obj/effect/spawner/lootdrop/roguetown/general_loot_low
	name = "low tier general loot spawner"
	lootcount = 1
	loot = list(
		//mats
		/obj/item/natural/bundle/stick = 4,
		/obj/item/natural/fibers = 4,
		/obj/item/natural/stone = 4,
		/obj/item/rogueore/coal	= 3,
		/obj/item/rogueore/iron = 2,
		/obj/item/natural/bundle/fibers = 2,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		//clothing
		/obj/item/clothing/head/roguetown/armingcap = 4,
		/obj/item/clothing/head/roguetown/knitcap = 4,
		/obj/item/clothing/cloak/stabard = 3,
		/obj/item/clothing/cloak/tabard = 3,
		/obj/item/clothing/cloak/raincloak/mortus = 3,
		/obj/item/clothing/cloak/apron = 3,
		/obj/item/clothing/cloak/apron/waist = 3,
		/obj/item/storage/backpack/rogue/satchel = 3,
		/obj/item/clothing/suit/roguetown/shirt/undershirt/random = 5,
		/obj/item/storage/belt/rogue/leather/cloth = 4,
		/obj/item/storage/belt/rogue/leather/rope = 3,
		/obj/item/storage/belt/rogue/leather/knifebelt/iron = 2,
		/obj/item/clothing/under/roguetown/tights/vagrant = 4,
		/obj/item/clothing/gloves/roguetown/leather = 2,
		/obj/item/clothing/gloves/roguetown/fingerless = 4,
		/obj/item/clothing/shoes/roguetown/simpleshoes = 4,
		/obj/item/clothing/shoes/roguetown/boots = 4,
		/obj/item/clothing/shoes/roguetown/boots/leather = 4,
		//money
		/obj/item/roguecoin/copper = 10,
		/obj/item/roguecoin/silver = 5,
		/obj/item/roguecoin/copper/pile = 3,
		/obj/item/roguecoin/silver/pile = 1,
		//junk
		/obj/item/rogue/instrument/flute = 3,
		/obj/item/ash = 5,
		/obj/item/natural/glass/shard = 5,
		/obj/item/candle/yellow = 3,
		/obj/item/flashlight/flare/torch = 3,
		/obj/item/reagent_containers/glass/bowl = 4,
		/obj/item/reagent_containers/glass/cup = 4,
		/obj/item/reagent_containers/glass/cup/wooden = 4,
		/obj/item/reagent_containers/glass/cup/steel = 1,
		/obj/item/reagent_containers/glass/cup/skull = 1,
		/obj/item/reagent_containers/glass/bucket/wooden = 3,
		/obj/item/natural/feather = 4,
		/obj/item/paper/scroll = 3,
		/obj/item/rope = 3,
		/obj/item/rope/chain = 3,
		/obj/item/storage/roguebag/crafted = 3,
		/obj/item/clothing/mask/cigarette/pipe = 3,
		/obj/item/paper = 3,
		/obj/item/reagent_containers/glass/bowl = 3,
		/obj/item/storage/bag/tray = 3,
		/obj/item/mundane/puzzlebox/medium = 1,
		/obj/item/mundane/puzzlebox/easy = 1,
		//medical
		/obj/item/needle/thorn = 4,
		/obj/item/natural/cloth = 5,
		//weapons
		/obj/item/gun/ballistic/revolver/grenadelauncher/bow = 2,
		/obj/item/quiver/arrows = 2,
		/obj/item/quiver/javelin = 2,
		/obj/item/quiver/sling = 1,
		/obj/item/rogueweapon/mace/alloy = 2,
		/obj/item/rogueweapon/mace/woodclub/crafted = 3,
		/obj/item/rogueweapon/mace/cudgel = 2,
		/obj/item/rogueweapon/mace/cudgel/copper = 2,
		/obj/item/rogueweapon/mace/wsword = 1,
		/obj/item/rogueweapon/mace/goden/aalloy = 1,
		/obj/item/rogueweapon/flail = 1,
		/obj/item/rogueweapon/huntingknife = 3,
		/obj/item/rogueweapon/huntingknife/stoneknife = 3,
		/obj/item/rogueweapon/huntingknife/copper = 3,
		/obj/item/rogueweapon/huntingknife/idagger/adagger = 3,
		/obj/item/rogueweapon/huntingknife/idagger = 3,
		/obj/item/rogueweapon/woodstaff = 3,
		/obj/item/rogueweapon/sword/short = 2,
		/obj/item/rogueweapon/sword/short/pashortsword = 2,
		/obj/item/rogueweapon/sword/stone = 3,
		/obj/item/rogueweapon/sword/iron = 1,
		/obj/item/rogueweapon/sword/iron/messer/copper = 1,
		/obj/item/rogueweapon/sword/falchion/militia = 1,
		/obj/item/rogueweapon/katar = 1,
		/obj/item/rogueweapon/spear = 2,
		/obj/item/rogueweapon/spear/aalloy = 3,
		/obj/item/rogueweapon/spear/militia = 1,
		/obj/item/rogueweapon/spear/improvisedbillhook = 1,
		/obj/item/rogueweapon/spear/stone/copper = 2,
		/obj/item/rogueweapon/fishspear = 1,
		/obj/item/rogueweapon/scythe = 2,
		/obj/item/rogueweapon/pitchfork = 2,
		/obj/item/rogueweapon/pitchfork/aalloy = 2,
		//tools
		/obj/item/rogueweapon/shovel = 3,
		/obj/item/rogueweapon/thresher = 3,
		/obj/item/flint = 4,
		/obj/item/rogueweapon/stoneaxe/woodcut = 3,
		/obj/item/rogueweapon/stoneaxe = 3,
		/obj/item/rogueweapon/hammer/stone = 3,
		/obj/item/rogueweapon/tongs = 3,
		/obj/item/rogueweapon/pick = 3,
		//armor
		/obj/item/clothing/suit/roguetown/armor/leather = 2,
		/obj/item/clothing/suit/roguetown/armor/leather/vest = 2,
		/obj/item/clothing/suit/roguetown/armor/leather/hide = 2,
		/obj/item/clothing/suit/roguetown/armor/leather/studded/bikini = 2,
		/obj/item/clothing/suit/roguetown/armor/leather/hide/bikini = 2,
		/obj/item/clothing/suit/roguetown/armor/gambeson = 2,
		/obj/item/clothing/under/roguetown/chainlegs/iron = 1,
		/obj/item/clothing/under/roguetown/brayette = 2,
		/obj/item/clothing/under/roguetown/chainlegs/iron/kilt = 1,
		/obj/item/clothing/gloves/roguetown/chain/aalloy = 2,
		/obj/item/clothing/gloves/roguetown/chain/iron = 1,
		/obj/item/clothing/suit/roguetown/armor/chainmail/iron = 2,
		/obj/item/clothing/suit/roguetown/armor/plate/half/aalloy = 1,
		/obj/item/clothing/suit/roguetown/armor/plate/half/iron = 1,
		/obj/item/clothing/suit/roguetown/armor/plate/half/copper = 1,
		/obj/item/clothing/suit/roguetown/armor/longcoat = 2,
		/obj/item/clothing/neck/roguetown/gorget = 1,
		/obj/item/clothing/neck/roguetown/gorget/aalloy =1,
		/obj/item/clothing/head/roguetown/helmet/leather = 2,
		/obj/item/clothing/head/roguetown/helmet/horned = 1,
		/obj/item/clothing/head/roguetown/helmet/skullcap = 1,
		//food
		/obj/item/reagent_containers/food/snacks/rogue/raisins = 3,
		/obj/item/reagent_containers/food/snacks/rogue/crackerscooked = 1,
		/obj/item/reagent_containers/powder/salt = 3,
		/obj/item/reagent_containers/food/snacks/egg = 1,
	)

/obj/effect/spawner/lootdrop/roguetown/general_loot_mid
	name = "mid tier general loot spawner"
	lootcount = 1
	loot = list(
		//mats
		/obj/item/natural/hide/cured = 2,
		/obj/item/natural/hide = 3,
		/obj/item/rogueore/coal	= 3,
		/obj/item/rogueore/iron = 2,
		/obj/item/rogueore/silver = 1,
		/obj/item/ingot/iron = 2,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		//clothing
		/obj/item/clothing/head/roguetown/armingcap = 4,
		/obj/item/clothing/head/roguetown/knitcap = 4,
		/obj/item/clothing/cloak/stabard = 3,
		/obj/item/clothing/cloak/tabard = 3,
		/obj/item/storage/backpack/rogue/satchel = 3,
		/obj/item/clothing/suit/roguetown/shirt/undershirt/random = 5,
		/obj/item/clothing/cloak/raincloak/mortus = 3,
		/obj/item/clothing/cloak/cape = 3,
		/obj/item/clothing/cloak/apron = 3,
		/obj/item/clothing/cloak/apron/waist = 3,
		/obj/item/storage/belt/rogue/leather = 3,
		/obj/item/storage/belt/rogue/leather/knifebelt/iron = 4,
		/obj/item/storage/belt/rogue/leather/knifebelt = 2,
		/obj/item/clothing/under/roguetown/tights/vagrant = 4,
		/obj/item/clothing/gloves/roguetown/leather = 4,
		/obj/item/clothing/shoes/roguetown/boots = 4,
		/obj/item/clothing/shoes/roguetown/boots/leather = 4,
		/obj/item/clothing/shoes/roguetown/boots/nobleboot = 4,
		//money
		/obj/item/roguecoin/copper = 10,
		/obj/item/roguecoin/silver = 5,
		/obj/item/roguecoin/copper/pile = 3,
		/obj/item/roguecoin/silver/pile = 1,
		//junk
		/obj/item/rogue/instrument/flute = 3,
		/obj/item/ash = 5,
		/obj/item/natural/glass/shard = 5,
		/obj/item/candle/yellow = 3,
		/obj/item/flashlight/flare/torch = 3,
		/obj/item/reagent_containers/glass/bowl = 4,
		/obj/item/reagent_containers/glass/cup = 4,
		/obj/item/reagent_containers/glass/cup/wooden = 4,
		/obj/item/reagent_containers/glass/cup/steel = 1,
		/obj/item/reagent_containers/glass/cup/skull = 1,
		/obj/item/reagent_containers/glass/bucket/wooden = 3,
		/obj/item/natural/feather = 4,
		/obj/item/paper/scroll = 3,
		/obj/item/rope = 3,
		/obj/item/rope/chain = 3,
		/obj/item/storage/roguebag/crafted = 3,
		/obj/item/clothing/mask/cigarette/pipe = 3,
		/obj/item/paper = 3,
		/obj/item/reagent_containers/glass/bowl = 3,
		/obj/item/storage/bag/tray = 3,
		/obj/item/mundane/puzzlebox/medium = 1,
		/obj/item/mundane/puzzlebox/easy = 1,
		//medical
		/obj/item/needle = 4,
		/obj/item/natural/cloth = 5,
		/obj/item/natural/bundle/cloth = 3,
		//weapons
		/obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve = 4,
		/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow = 3,
		/obj/item/gun/ballistic/revolver/grenadelauncher/sling = 4,
		/obj/item/quiver/arrows = 2,
		/obj/item/quiver/javelin = 2,
		/obj/item/quiver/sling = 2,
		/obj/item/quiver/Warrows = 1,
		/obj/item/quiver/Wbolts = 1,
		/obj/item/quiver/bolts = 2,
		/obj/item/rogueweapon/mace = 2,
		/obj/item/rogueweapon/mace/cudgel = 2,
		/obj/item/rogueweapon/mace/goden/steel/paalloy = 2,
		/obj/item/rogueweapon/mace/goden = 2,
		/obj/item/rogueweapon/mace/warhammer = 2,
		/obj/item/rogueweapon/flail = 1,
		/obj/item/rogueweapon/flail/sflail/paflail = 2,
		/obj/item/rogueweapon/huntingknife/idagger/adagger = 3,
		/obj/item/rogueweapon/huntingknife/idagger = 3,
		/obj/item/rogueweapon/huntingknife/idagger/steel/padagger = 3,
		/obj/item/rogueweapon/huntingknife/idagger/steel/parrying = 2,
		/obj/item/rogueweapon/woodstaff = 3,
		/obj/item/rogueweapon/sword/short = 2,
		/obj/item/rogueweapon/sword/short/pashortsword = 2,
		/obj/item/rogueweapon/sword/stone = 3,
		/obj/item/rogueweapon/sword/iron = 1,
		/obj/item/rogueweapon/sword/iron/messer/copper = 1,
		/obj/item/rogueweapon/sword/falchion/militia = 1,
		/obj/item/rogueweapon/katar = 1,
		/obj/item/rogueweapon/spear = 2,
		/obj/item/rogueweapon/spear/billhook = 2,
		/obj/item/rogueweapon/spear/aalloy = 3,
		/obj/item/rogueweapon/spear/militia = 1,
		/obj/item/rogueweapon/halberd/bardiche = 2,
		/obj/item/rogueweapon/halberd/bardiche/paalloy = 1,
		/obj/item/rogueweapon/scythe = 2,
		/obj/item/rogueweapon/pitchfork = 2,
		/obj/item/rogueweapon/pitchfork/aalloy = 2,
		//tools
		/obj/item/rogueweapon/shovel = 3,
		/obj/item/rogueweapon/thresher = 3,
		/obj/item/flint = 4,
		/obj/item/rogueweapon/stoneaxe/woodcut = 3,
		/obj/item/rogueweapon/stoneaxe = 3,
		/obj/item/rogueweapon/hammer/stone = 3,
		/obj/item/rogueweapon/tongs = 3,
		/obj/item/rogueweapon/pick = 3,
		//armor
		/obj/item/clothing/suit/roguetown/armor/leather/studded = 2,
		/obj/item/clothing/suit/roguetown/armor/leather/heavy = 2,
		/obj/item/clothing/suit/roguetown/armor/leather/hide = 2,
		/obj/item/clothing/suit/roguetown/armor/leather/studded/bikini = 2,
		/obj/item/clothing/suit/roguetown/armor/leather/hide/bikini = 2,
		/obj/item/clothing/suit/roguetown/armor/gambeson = 2,
		/obj/item/clothing/under/roguetown/chainlegs/iron = 1,
		/obj/item/clothing/under/roguetown/brayette = 2,
		/obj/item/clothing/under/roguetown/chainlegs/iron/kilt = 1,
		/obj/item/clothing/gloves/roguetown/chain/aalloy = 2,
		/obj/item/clothing/gloves/roguetown/chain/iron = 1,
		/obj/item/clothing/suit/roguetown/armor/chainmail/iron = 2,
		/obj/item/clothing/suit/roguetown/armor/plate/half/aalloy = 1,
		/obj/item/clothing/suit/roguetown/armor/plate/half/iron = 1,
		/obj/item/clothing/suit/roguetown/armor/plate/half/copper = 1,
		/obj/item/clothing/suit/roguetown/armor/longcoat = 2,
		/obj/item/clothing/neck/roguetown/gorget = 1,
		/obj/item/clothing/neck/roguetown/gorget/aalloy =1,
		/obj/item/clothing/head/roguetown/helmet/leather = 2,
		/obj/item/clothing/head/roguetown/helmet/horned = 1,
		/obj/item/clothing/head/roguetown/helmet/skullcap = 1,
		//food
		/obj/item/reagent_containers/food/snacks/rogue/raisins = 3,
		/obj/item/reagent_containers/food/snacks/rogue/crackerscooked = 1,
		/obj/item/reagent_containers/powder/salt = 3,
		/obj/item/reagent_containers/food/snacks/egg = 1,
	)

/obj/effect/spawner/lootdrop/roguetown/general_loot_hi
	name = "high tier general loot spawner"
	lootcount = 1
	loot = list(

	)

//x3 of the above

/obj/effect/spawner/lootdrop/roguetown/general_loot_low/x3
	name = "low tier general loot spawnerx3"
	lootcount = 3

/obj/effect/spawner/lootdrop/roguetown/general_loot_mid/x3
	name = "mid tier general loot spawnerx3"
	lootcount = 3

/obj/effect/spawner/lootdrop/roguetown/general_loot_hi/x3
	name = "high tier general loot spawnerx3"
	lootcount = 3

/*
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡤⠀⠀⢀⣀⡀⢄⣀⣀⣀⠀⠠⠀⠒⠀⠈⠉⠛⠩⡉⢂⠑⡄⠀⠐⠒⠂⠤⠄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢏⢢⠀⠀⠀⢀⠄⢊⠜⠋⠉⠁⠀⠀⠀⠀⠀⡠⠒⠉⠀⡠⠃⠑⠺⢄⠀⠀⠀⠀⠉⠑⠢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠑⣄⠈⡠⠊⠁⠀⠀⠀⠀⠀⠀⠀⢀⠔⢀⠀⠀⠘⠰⣆⠀⠀⠀⢢⠀⠀⠀⠂⠤⢄⡀⠈⠑⠤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠇⠀⣸⠊⠀⠀⠀⠀⠀⠀⠀⠀⡠⢂⠊⡰⠃⠀⠀⡆⠀⣏⠀⠀⠀⠀⠡⡀⠀⠀⠀⠀⠈⠁⠣⣔⡈⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠞⢁⠀⠀⠀⠀⠀⢀⠄⢀⠞⠀⢆⡜⠁⠀⠀⢰⠅⡀⠹⡇⠀⠀⠀⠀⠱⡀⠀⠀⠀⠀⠀⠀⠈⠉⠓⠚⠦⠄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡡⢋⡔⠁⠀⠀⠀⡰⢀⠎⠠⡝⠀⢸⡜⠀⠀⠀⢀⢃⢡⢣⠀⢣⠀⠀⠀⠀⠀⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⢐⠖⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠮⡎⡝⠀⠀⠀⢀⡞⠁⡞⢠⡝⠀⠀⣿⠃⠀⠀⠀⡜⡌⡜⡼⣆⠈⢣⠀⠀⠀⠀⠈⠀⣀⣀⠀⠀⠀⠠⠄⠂⢁⠔⠋⢃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠴⠊⠁⡜⡌⠀⠀⠀⢒⠞⢲⠸⢧⣿⠁⠀⢀⡟⠀⢀⠆⢠⠡⡰⡇⡘⢿⣦⡀⠣⡀⠀⠀⠀⡆⢢⠀⠀⠀⠀⠀⣠⠖⠁⠀⠀⠈⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡙⠀⢠⠁⠀⡌⡄⣎⡗⡡⡌⠀⠀⡼⠇⠀⡜⠀⡬⢤⠧⣇⢱⠀⠑⠱⢄⡈⠢⢄⠀⠇⢢⢣⠀⠀⡠⡪⢲⡆⠀⠀⠀⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣬⠀⢠⡇⠀⡜⡠⠐⢹⡌⠀⡇⠀⢰⢸⠀⢀⠇⡷⡆⠸⠀⡇⢩⠂⢄⠀⠀⠈⠁⠀⠀⠁⡎⡆⡤⢊⠔⠀⠀⣇⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢣⠀⣞⠁⢰⣯⣤⣤⡘⢅⠀⡇⠀⡄⡀⠀⢸⢠⢃⢀⡇⠀⣠⢨⠀⡇⠁⡆⠀⠀⠀⠀⠀⣇⠏⡗⠁⠀⠀⠀⢹⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣎⢞⢰⢸⠀⡘⢈⣶⣶⣾⣵⠀⢳⡇⡇⡇⠀⢸⡎⣌⠸⠥⡀⠉⡄⠀⡇⠀⠀⠀⠀⠀⠀⠚⠀⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠃⡏⢸⠀⡀⣇⢸⠉⢻⡽⢟⠁⠘⢷⢻⡅⠀⣺⣿⣭⣭⣿⣰⢤⣱⠀⠃⢀⡀⠀⠀⠀⠀⠇⢸⠀⠀⠀⠀⠀⠀⡀⠀⠀⡄⠀⡸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⢰⡏⠀⣇⡿⡦⣃⡘⣁⠎⠀⠀⠈⢻⠱⡀⠘⠛⠿⣟⣻⣿⡷⡝⣷⠀⣸⠀⠀⢸⢀⢲⠀⡆⢰⠀⠀⡇⠀⢠⡇⠀⡸⠀⢀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⡀⠐⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠿⣀⡏⣇⢞⢼⠉⠑⠈⠀⠀⠀⠀⠉⠻⢄⣆⠸⣻⠟⠁⠹⠅⣸⢀⡋⠀⠀⡎⡸⡈⠰⠀⡛⠀⢠⠇⢀⢳⠁⢰⢁⢼⡘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢠⠎⠉⠐⠀⠀⠸⡆⠀⠀⠀⠀⠀⠀⠠⠄⡀⠀⠀⠀⢹⠊⠈⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣘⠢⢤⣠⡔⣎⠀⡇⡌⠃⠀⡸⢠⢣⡇⢆⢠⠁⢠⢻⠀⣌⣸⠀⢃⠎⡸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⣆⠀⠀⠀⠀⢸⠃⠀⠀⢰⠉⠑⠤⠃⠀⡇⠀⠀⠀⠀⢂⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⢲⣿⡟⣾⣾⡦⠱⣸⣿⠘⠀⣰⡡⠁⠸⣇⢀⠇⠀⠎⡌⣼⡪⢷⠸⠃⡰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠙⠲⠤⠄⠀⠎⠀⠀⠀⠈⢆⢄⠀⠀⢠⠃⠀⠀⠀⠀⠀⠱⡀⠀⠀⠀⠀⠑⠀⠀⠀⠀⠀⠈⠉⡝⠚⠿⠃⠆⡝⡝⡆⡴⠟⢁⠂⢀⢋⣬⢀⢊⡜⡼⠋⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠑⠒⠂⠁⠀⠀⠀⠀⠀⠀⠀⠈⢢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢰⣣⡘⡀⠀⡎⢀⡧⠂⡏⡰⢱⠊⠀⠀⠀⠈⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀  ⠑⠤⠀⣀⣀⣀⣀⣀⣀⣀⠀⠀⠤⠐⠂⠈⠋⡏⢱⢠⣿⡇⣬⣀⠀⢷⠁⠈⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⡉⠀⠀⡇⠀⠀⠀⠉⠀⠉⠉⠉⠉⠉⠁⣠⡔⠛⢆⠰⡼⣣⠀⠀⠀⠀⠀⠀⡠⠊⠀⡇⣿⣾⠛⠳⠇⠶⣭⣺⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⣀⠤⠤⠴⠿⡷⡀⠘⡄⢻⡿⠆⠀⠀⡠⠔⠁⠀⠀⣀⣿⣽⠟⠠⠠⠐⠂⠙⠋⣁⡅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
*/
