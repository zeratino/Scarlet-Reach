
//a ridable boat so players can traverse water tiles without drowning

/obj/vehicle/ridden/dinghy
	name = "dinghy"
	desc = "An unpretentious craft of pitch-sealed planks."
	icon = 'icons/obj/boat.dmi'
	icon_state = "dinghy"
	can_buckle = TRUE
	layer = ABOVE_MOB_LAYER
	var/allowed_turf = /turf/open/water //includes all subtypes of water

/obj/vehicle/ridden/dinghy/Initialize(mapload)
	. = ..()
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.keytype = /obj/item/rogueweapon/mace/oar
	D.allowed_turf_typecache = typecacheof(allowed_turf)

/obj/item/rogueweapon/mace/oar
	name = "oar"
	desc = "A wooden "
	icon = 'icons/obj/boat_accessories.dmi'
	icon_state = "oar"
	gripped_intents = null
	force = 15
	wdefense = 10
	smeltresult = null

/obj/item/rogueweapon/mace/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list(
					"shrink" = 0.6,
					"sx" = -11,
					"sy" = -8,
					"nx" = 12,
					"ny" = -8,
					"wx" = -5,
					"wy" = -8,
					"ex" = 6,
					"ey" = -8,
					"northabove" = 0,
					"southabove" = 1,
					"eastabove" = 1,
					"westabove" = 0,
					"nturn" = 90,
					"sturn" = -90,
					"wturn" = -90,
					"eturn" = 90,
					"nflip" = 0,
					"sflip" = 8,
					"wflip" = 8,
					"eflip" = 0
					)
			if("wielded")
				return list(
					"shrink" = 0.7,
					"sx" = 5,
					"sy" = -4,
					"nx" = -5,
					"ny" = -4,
					"wx" = -5,
					"wy" = -3,
					"ex" = 7,
					"ey" = -4,
					"northabove" = 0,
					"southabove" = 1,
					"eastabove" = 1,
					"westabove" = 0,
					"nturn" = -45,
					"sturn" = 45,
					"wturn" = -45,
					"eturn" = 45,
					"nflip" = 8,
					"sflip" = 0,
					"wflip" = 8,
					"eflip" = 0
					)
			if("onbelt")
				return list(
					"shrink" = 0.5,
					"sx" = -2,
					"sy" = -5,
					"nx" = 4,
					"ny" = -5,
					"wx" = 0,
					"wy" = -5,
					"ex" = 2,
					"ey" = -5,
					"nturn" = 0,
					"sturn" = 0,
					"wturn" = 0,
					"eturn" = 0,
					"nflip" = 0,
					"sflip" = 0,
					"wflip" = 0,
					"eflip" = 0,
					"northabove" = 0,
					"southabove" = 1,
					"eastabove" = 1,
					"westabove" = 0
					)

/datum/crafting_recipe/oar
	name = "Oar"
	result = /obj/item/rogueweapon/mace/oar
	reqs = list(
		/obj/item/grown/log/tree = 1,
		/obj/item/natural/fibers = 2,
		)
	time = 15

/datum/crafting_recipe/boat
	name = "Dinghy"
	result = /obj/vehicle/ridden/dinghy
	reqs = list(
		/obj/item/grown/log/tree = 4,
		/obj/item/ash = 3,
		/obj/item/natural/fibers = 5
		)
	time = 50
