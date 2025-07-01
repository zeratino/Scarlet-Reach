// This is almost entirely a copy paste of the Ratwood bunker system repurposed for adding in Age vetted people.

GLOBAL_LIST_INIT(agevetted_list, load_agevets_from_file())

/client/proc/check_agevet()
	if(ckey in GLOB.agevetted_list || holder)
		return TRUE
	return FALSE

/client/proc/agevet_player()
	set category = "-GameMaster-"
	set name = "Age Vet Someone"

	if(!check_rights())
		return

	var/selection = input("Who would you like to verify?", "CKEY", "") as text|null
	if(selection)
		add_agevet(selection, ckey)

/proc/add_agevet(target_ckey, admin_ckey = "SYSTEM")
	if(!target_ckey || (target_ckey in GLOB.agevetted_list))
		return

	target_ckey = ckey(target_ckey)
	GLOB.agevetted_list |= target_ckey
	message_admins("AGE VETTING : Added [target_ckey] to the agevetted list[admin_ckey? " by [admin_ckey]":""]")
	log_admin("AGE VETTING : Added [target_ckey] to the agevetted list[admin_ckey? " by [admin_ckey]":""]")
	save_agevets_to_file()

/proc/load_agevets_from_file()
	var/json_file = file("data/agevets.json")
	if(fexists(json_file))
		var/list/json = json_decode(file2text(json_file))
		return json["data"]
	else
		return list()

/proc/save_agevets_to_file()
	var/json_file = file("data/agevets.json")
	var/list/file_data = list()
	file_data["data"] = GLOB.agevetted_list
	fdel(json_file)
	WRITE_FILE(json_file,json_encode(file_data))

