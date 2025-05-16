
/datum/crafting_recipe/roguetown/cooking/mobilestove_tallow
	name = "render tallow over the mobile stove"
	result = list(
				/obj/item/reagent_containers/food/snacks/tallow,
				/obj/item/reagent_containers/food/snacks/tallow,
				/obj/item/reagent_containers/food/snacks/tallow,
				)
	reqs = list(/obj/item/reagent_containers/food/snacks/fat = 1)
	tools = list(/obj/item/cooking/pan,)
	structurecraft = /obj/machinery/light/rogue/hearth/mobilestove
	craftdiff = 0
	craftsound = 'sound/misc/frying.ogg'
	req_table = FALSE
	verbage_simple = "render"
	verbage = "renders"
    