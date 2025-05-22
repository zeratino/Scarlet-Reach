/datum/roguestock/bounty/treasure
	name = "Collectable Treasures"
	desc = "Treasures are directly reminted into coins that is deposited into the treasury."
	item_type = /obj/item
	payout_price = 10
	mint_item = TRUE
	percent_bounty = TRUE

/datum/roguestock/bounty/treasure/get_payout_price(obj/item/I)
	if(!I)
		return ..()
	var/bounty_percent = (payout_price/100) * I.get_real_price()
	bounty_percent = round(bounty_percent)
	if(bounty_percent < 1)
		return 0
	return bounty_percent

/datum/roguestock/bounty/treasure/check_item(obj/item/I)
	if(!I)
		return
	if(I.get_real_price() > 0)
		if(istype(I, /obj/item/roguestatue))
			return TRUE
		if(istype(I, /obj/item/reagent_containers/glass/cup))
			return TRUE
		if(istype(I, /obj/item/roguegem))
			return TRUE
