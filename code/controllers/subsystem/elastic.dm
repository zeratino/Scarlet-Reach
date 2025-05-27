/datum/config_entry/flag/elastic_middleware_enabled

/datum/config_entry/string/elastic_endpoint
	protection = CONFIG_ENTRY_HIDDEN

/datum/config_entry/string/metrics_api_token
	protection = CONFIG_ENTRY_HIDDEN

SUBSYSTEM_DEF(elastic)
	name = "Elastic Middleware"
	wait = 30 SECONDS
	runlevels = RUNLEVEL_LOBBY | RUNLEVEL_SETUP | RUNLEVEL_GAME | RUNLEVEL_POSTGAME
	flags = SS_KEEP_TIMING // This needs to ingest every 30 IRL seconds, not ingame seconds.
	/// The TIMEOFDAY when /world was created. Set in Genesis.
	var/world_init_time = 0
	/// Compiled round list data. Interfaced with [proc/add_list_data]
	var/list/assoc_list_data = list() //! ### This NEEDS NEEDS NEEDS NEEDS NEEDS to be an assoclist. When 516 is in this will be an alist
	///abstract information - basically want to keep track of spell casts over the round? do it like this
	var/list/abstract_information = list()

/datum/controller/subsystem/elastic/Initialize(start_timeofday)
	if(!CONFIG_GET(flag/elastic_middleware_enabled))
		flags |= SS_NO_FIRE // Disable firing to save CPU
	set_abstract_data_zeros()
	return ..()

/datum/controller/subsystem/elastic/fire(resumed)
	send_data()

/datum/controller/subsystem/elastic/proc/send_data()
	var/datum/http_request/request = new()
	request.prepare(RUSTG_HTTP_METHOD_POST, CONFIG_GET(string/elastic_endpoint), get_compiled_data(), list(
		"Authorization" = "ApiKey [CONFIG_GET(string/metrics_api_token)]",
		"Content-Type" = "application/json"
	))
	request.begin_async()

/datum/controller/subsystem/elastic/proc/get_compiled_data()
	var/list/compiled = list()
	//DON'T CHANGE ANY OF THIS BLOCK EVER OR THIS WILL ALL BREAK
	compiled["@timestamp"] = time_stamp_metric()
	compiled["cpu"] = world.cpu
	compiled["elapsed_process_time"] = world.time
	compiled["elapsed_real_time"] = (REALTIMEOFDAY - world_init_time)
	compiled["client_count"] = length(GLOB.clients)
	compiled["round_id"] = GLOB.rogue_round_id // if you are on literally any other server change this to a text2num(GLOB.round_id)
	compiled |= assoc_list_data // you see why this needs to be an assoc list now?

	// down here is specific to vanderlin so if you are porting this you can take this out
	compiled["round_data"] = get_round_data()

	assoc_list_data = list()
	return json_encode(compiled)

/datum/controller/subsystem/elastic/proc/get_round_data()
	var/list/round_data = list()

	for(var/patron_name in GLOB.patron_follower_counts)
		round_data["[patron_name]_followers"] = GLOB.patron_follower_counts[patron_name]

	round_data["blood_lost"] = round(GLOB.azure_round_stats[STATS_BLOOD_SPILT] / 100, 1)
	round_data["ankles_broken"] = GLOB.azure_round_stats[STATS_ANKLES_BROKEN]
	round_data["deaths"] = GLOB.azure_round_stats[STATS_DEATHS]
	round_data["noble_deaths"] = GLOB.azure_round_stats[STATS_NOBLE_DEATHS]
	round_data["moat_fallers"] = GLOB.azure_round_stats[STATS_MOAT_FALLERS]
	round_data["smited"] = GLOB.azure_round_stats[STATS_PEOPLE_SMITTEN]
	round_data["gibbed"] = GLOB.azure_round_stats[STATS_PEOPLE_GIBBED]
	round_data["triumph_gained"] = GLOB.azure_round_stats[STATS_TRIUMPHS_AWARDED]
	round_data["triumph_lost"] = GLOB.azure_round_stats[STATS_TRIUMPHS_STOLEN]
	round_data["snorted_drugs"] = GLOB.azure_round_stats[STATS_DRUGS_SNORTED]
	round_data["beards_shaved"] = GLOB.azure_round_stats[STATS_BEARDS_SHAVED]
	round_data["trees_cut"] = GLOB.azure_round_stats[STATS_TREES_CUT]
	round_data["prayers_made"] = GLOB.azure_round_stats[STATS_PRAYERS_MADE]
	round_data["fish_caught"] = GLOB.azure_round_stats[STATS_FISH_CAUGHT]
	round_data["items_pickpocketed"] = GLOB.azure_round_stats[STATS_ITEMS_PICKPOCKETED]
	round_data["masterworks_forged"] = GLOB.azure_round_stats[STATS_MASTERWORKS_FORGED]
	round_data["taxes_collected"] = GLOB.azure_round_stats[STATS_TAXES_COLLECTED]
	round_data["organs_eaten"] = GLOB.azure_round_stats[STATS_ORGANS_EATEN]
	round_data["kisses_made"] = GLOB.azure_round_stats[STATS_KISSES_MADE]
	round_data["laughs_made"] = GLOB.azure_round_stats[STATS_LAUGHS_MADE]
	round_data["skeletons_killed"] = GLOB.azure_round_stats[STATS_SKELETONS_KILLED]
	round_data["potions_brewed"] = GLOB.azure_round_stats[STATS_POTIONS_BREWED]
	round_data["revivals"] = GLOB.azure_round_stats[STATS_REVIVALS]
	round_data["plants_harvested"] = GLOB.azure_round_stats[STATS_PLANTS_HARVESTED]
	round_data["humen_deaths"] = GLOB.azure_round_stats[STATS_HUMEN_DEATHS]
	round_data["laws_and_decrees_made"] = GLOB.azure_round_stats[STATS_LAWS_AND_DECREES_MADE]
	round_data["alive_nobles"] = GLOB.azure_round_stats[STATS_ALIVE_NOBLES]
	round_data["books_printed"] = GLOB.azure_round_stats[STATS_BOOKS_PRINTED]
	round_data["books_bruned"] = GLOB.azure_round_stats[STATS_BOOKS_BURNED]
	round_data["skills_learned"] = GLOB.azure_round_stats[STATS_SKILLS_LEARNED]
	round_data["graves_robbed"] = GLOB.azure_round_stats[STATS_GRAVES_ROBBED]
	round_data["deadites_killed"] = GLOB.azure_round_stats[STATS_DEADITES_KILLED]
	round_data["vampires_killed"] = GLOB.azure_round_stats[STATS_VAMPIRES_KILLED]
	round_data["wounds_healed"] = GLOB.azure_round_stats[STATS_WOUNDS_SEWED]
	round_data["rot_cured"] = GLOB.azure_round_stats[STATS_ROT_CURED]
	round_data["werevolves"] = GLOB.azure_round_stats[STATS_WEREVOLVES]
	round_data["druids_alive"] = GLOB.azure_round_stats[STATS_DRUIDS_ALIVE]
	round_data["combat_skills"] = GLOB.azure_round_stats[STATS_COMBAT_SKILLS]
	round_data["parries"] = GLOB.azure_round_stats[STATS_PARRIES]
	round_data["warcries"] = GLOB.azure_round_stats[STATS_WARCRIES]
	round_data["yields"] = GLOB.azure_round_stats[STATS_YIELDS]
	round_data["people_mocked"] = GLOB.azure_round_stats[STATS_PEOPLE_MOCKED]
	round_data["crits_made"] = GLOB.azure_round_stats[STATS_CRITS_MADE]
	round_data["ores_mined"] = GLOB.azure_round_stats[STATS_ROCKS_MINED]
	round_data["craft_skills"] = GLOB.azure_round_stats[STATS_CRAFT_SKILLS]
	round_data["abyssor_remembered"] = GLOB.azure_round_stats[STATS_ABYSSOR_REMEMBERED]
	round_data["leeches_embedded"] = GLOB.azure_round_stats[STATS_LEECHES_EMBEDDED]
	round_data["hugs_made"] = GLOB.azure_round_stats[STATS_HUGS_MADE]
	round_data["clingy_people"] = GLOB.azure_round_stats[STATS_CLINGY_PEOPLE]
	round_data["zizo_praised"] = GLOB.azure_round_stats[STATS_ZIZO_PRAISED]
	round_data["deadites_alive"] = GLOB.azure_round_stats[STATS_DEADITES_ALIVE]
	round_data["priest_deaths"] = GLOB.azure_round_stats[STATS_CLERGY_DEATHS]
	round_data["alcohol_consumed"] = GLOB.azure_round_stats[STATS_ALCOHOL_CONSUMED]
	round_data["alcoholics"] = GLOB.azure_round_stats[STATS_ALCOHOLICS]
	round_data["junkies"] = GLOB.azure_round_stats[STATS_JUNKIES]
	round_data["shrine_value"] = GLOB.azure_round_stats[STATS_SHRINE_VALUE]
	round_data["greedy_people"] = GLOB.azure_round_stats[STATS_GREEDY_PEOPLE]
	round_data["pleasures"] = GLOB.azure_round_stats[STATS_PLEASURES]
	round_data["skills_dreamed"] = GLOB.azure_round_stats[STATS_SKILLS_DREAMED]
	round_data["alive_tieflings"] = GLOB.azure_round_stats[STATS_ALIVE_TIEFLINGS]
	
	round_data["people_drowned"] = GLOB.azure_round_stats[STATS_PEOPLE_DROWNED]
	round_data["water_consumed"] = GLOB.azure_round_stats[STATS_WATER_CONSUMED]
	round_data["locks_picked"] = GLOB.azure_round_stats[STATS_LOCKS_PICKED]
	round_data["songs_played"] = GLOB.azure_round_stats[STATS_SONGS_PLAYED]
	round_data["food_rotted"] = GLOB.azure_round_stats[STATS_FOOD_ROTTED]
	round_data["forest_deaths"] = GLOB.azure_round_stats[STATS_FOREST_DEATHS]
	round_data["tortures"] = GLOB.azure_round_stats[STATS_TORTURES]
	round_data["deadites_woken_up"] = GLOB.azure_round_stats[STATS_DEADITES_WOKEN_UP]

	return round_data

/datum/controller/subsystem/elastic/proc/add_list_data(main_cat = ELASCAT_GENERIC, list/assoc_data)
	if(!main_cat || !length(assoc_data))
		return

	assoc_list_data |= main_cat
	if(!length(assoc_list_data[main_cat]))
		assoc_list_data[main_cat] = list()
	assoc_list_data[main_cat] |= assoc_data

/// Inserts `(|=)` a datapoint into an elasticsearch category's data packet.
/proc/add_elastic_data(main_cat, list/assoc_data)
	if(!main_cat || !length(assoc_data))
		return
	SSelastic.add_list_data(main_cat, assoc_data)
	return TRUE

/// Inserts `(|=)` and immediately sends the provided data packet to elasticsearch.
/// This should be used for logging purposes, such as runtimes or wanting to track "player x did y".
/proc/add_elastic_data_immediate(main_cat, list/assoc_data)
	if(add_elastic_data(main_cat, assoc_data))
		SSelastic.send_data()
		return TRUE

/// Adds `(+=)` a numerical value to an elasticsearch data point.
/// Think "x event ran 12 times this packet" since you're updating the number with the total ran anyway.
/proc/add_abstract_elastic_data(main_cat, abstract_name, abstract_value, maximum)
	if(!main_cat || !isnum(abstract_value))
		return

	SSelastic.abstract_information |= abstract_name
	SSelastic.abstract_information[abstract_name] += abstract_value
	if(maximum)
		SSelastic.abstract_information[abstract_name] = min(maximum, SSelastic.abstract_information[abstract_name])

	var/list/data = list("[abstract_name]" = SSelastic.abstract_information[abstract_name])
	SSelastic.add_list_data(main_cat, data)
	return TRUE

/// Zeroes out some abstract data values.
/// This really exists if you want data to start at 0, useful for timeseries data without round filtering.
/proc/set_abstract_data_zeros()
	add_abstract_elastic_data(ELASCAT_COMBAT, ELASDATA_EATEN_BODIES, 0)
	add_abstract_elastic_data(ELASCAT_COMBAT, ELASDATA_DECAPITATIONS, 0)

	add_abstract_elastic_data(ELASCAT_ECONOMY, ELASDATA_MAMMONS_GAINED, 0)
	add_abstract_elastic_data(ELASCAT_ECONOMY, ELASDATA_MAMMONS_SPENT, 0)
