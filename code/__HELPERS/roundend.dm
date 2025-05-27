#define POPCOUNT_SURVIVORS "survivors"					//Not dead at roundend
#define POPCOUNT_ESCAPEES "escapees"					//Not dead and on centcom/shuttles marked as escaped

// General statistics

#define STATS_MOAT_FALLERS "moat_fallers"
#define STATS_ANKLES_BROKEN "ankles_broken"
#define STATS_PEOPLE_SMITTEN "people_smitten"
#define STATS_TRIUMPHS_AWARDED "triumphs_awarded"
#define STATS_TRIUMPHS_STOLEN "triumphs_stolen"
#define STATS_PRAYERS_MADE "prayers_made"
#define STATS_SKILLS_LEARNED "skills_learned"
#define STATS_DEADITES_ALIVE "deadites_alive"

// Influence related statistics

//Psydon
#define STATS_HUMEN_DEATHS "humen_deaths"
#define STATS_ALIVE_TIEFLINGS "alive_tieflings"

//Astratan
#define STATS_LAWS_AND_DECREES_MADE "laws_and_decrees_made"
#define STATS_ALIVE_NOBLES "alive_nobles"
#define STATS_NOBLE_DEATHS "noble_deaths"
#define STATS_REVIVALS "revivals"
#define STATS_TAXES_COLLECTED "taxes_collected"

//Noc
#define STATS_BOOKS_PRINTED "books_printed"
#define STATS_LITERACY_TAUGHT "literacy_taught"
#define STATS_BOOKS_BURNED "books_burned"
#define STATS_SKILLS_DREAMED "skills_dreamed"

//Necra
#define STATS_SKELETONS_KILLED "skeletons_killed"
#define STATS_GRAVES_ROBBED "graves_robbed"
#define STATS_DEADITES_KILLED "deadites_killed"
#define STATS_VAMPIRES_KILLED "vampires_killed"

//Pestra
#define STATS_POTIONS_BREWED "potions_brewed"
#define STATS_WOUNDS_SEWED "wounds_healed"
#define STATS_ROT_CURED "rot_cured"
#define STATS_FOOD_ROTTED "food_rotted"

//Dendor
#define STATS_TREES_CUT "trees_cut"
#define STATS_PLANTS_HARVESTED "plants_harvested"
#define STATS_WEREVOLVES "werevolves"
#define STATS_FOREST_DEATHS "forest_deaths"

//Ravox
#define STATS_COMBAT_SKILLS "combat_skills"
#define STATS_PARRIES "parries"
#define STATS_WARCRIES "warcries"
#define STATS_YIELDS "yields"

//Xylix
#define STATS_LAUGHS_MADE "laughs_made"
#define STATS_PEOPLE_MOCKED "people_mocked"
#define STATS_CRITS_MADE "crits_made"
#define STATS_SONGS_PLAYED "songs_played"

//Malum
#define STATS_MASTERWORKS_FORGED "masterworks_forged"
#define STATS_ROCKS_MINED "ores_mined"
#define STATS_CRAFT_SKILLS "craft_skills"
#define STATS_BEARDS_SHAVED "beards_shaved"

//Abyssor
#define STATS_WATER_CONSUMED "water_consumed"
#define STATS_FISH_CAUGHT "fish_caught"
#define STATS_ABYSSOR_REMEMBERED "abyssor_remembered"
#define STATS_LEECHES_EMBEDDED "leeches_embedded"
#define STATS_PEOPLE_DROWNED "people_drowned"

//Eora
#define STATS_KISSES_MADE "kisses_made"
#define STATS_PLEASURES "pleasures"
#define STATS_HUGS_MADE "hugs_made"
#define STATS_CLINGY_PEOPLE "clingy_people"

//Zizo
#define STATS_ZIZO_PRAISED "zizo_praised"
#define STATS_DEADITES_WOKEN_UP "deadites_woken_up"
#define STATS_CLERGY_DEATHS "priest_deaths"
#define STATS_TORTURES "tortures"

//Graggar
#define STATS_BLOOD_SPILT "blood_spilt"
#define STATS_ORGANS_EATEN "organs_eaten"
#define STATS_DEATHS "deaths"
#define STATS_PEOPLE_GIBBED "people_gibbed"

//Baotha
#define STATS_DRUGS_SNORTED "drugs_snorted"
#define STATS_ALCOHOL_CONSUMED "alcohol_consumed"
#define STATS_ALCOHOLICS "alcoholics"
#define STATS_JUNKIES "junkies"

//Matthios
#define STATS_ITEMS_PICKPOCKETED "items_pickpocketed"
#define STATS_SHRINE_VALUE "shrine_value"
#define STATS_GREEDY_PEOPLE "tomb_deaths"
#define STATS_LOCKS_PICKED "locks_picked"

GLOBAL_LIST_INIT(azure_round_stats, list(
	STATS_DEATHS = 0,
	STATS_NOBLE_DEATHS = 0,
	STATS_MOAT_FALLERS = 0,
	STATS_ANKLES_BROKEN = 0,
	STATS_PEOPLE_SMITTEN = 0,
	STATS_BLOOD_SPILT = 0,
	STATS_PEOPLE_GIBBED = 0,
	STATS_TRIUMPHS_AWARDED = 0,
	STATS_TRIUMPHS_STOLEN = 0,
	STATS_DRUGS_SNORTED = 0,
	STATS_BEARDS_SHAVED = 0,
	STATS_TREES_CUT = 0,
	STATS_PRAYERS_MADE = 0,
	STATS_FISH_CAUGHT = 0,
	STATS_ITEMS_PICKPOCKETED = 0,
	STATS_MASTERWORKS_FORGED = 0,
	STATS_TAXES_COLLECTED = 0,
	STATS_ORGANS_EATEN = 0,
	STATS_KISSES_MADE = 0,
	STATS_LAUGHS_MADE = 0,
	STATS_GRAVES_CONSECRATED = 0,
	STATS_POTIONS_BREWED = 0,
	STATS_REVIVALS = 0,
	STATS_PLANTS_HARVESTED = 0,
	STATS_LAWS_AND_DECREES_MADE = 0,
	STATS_ALIVE_NOBLES = 0,
	STATS_BOOKS_PRINTED = 0,
	STATS_LITERACY_TAUGHT = 0,
	STATS_BOOKS_BURNED = 0,
	STATS_SKILLS_LEARNED = 0,
	STATS_GRAVES_ROBBED = 0,
	STATS_DEADITES_KILLED = 0,
	STATS_VAMPIRES_KILLED = 0,
	STATS_WOUNDS_SEWED = 0,
	STATS_ROT_CURED = 0,
	STATS_WEREVOLVES = 0,
	STATS_FOREST_DEATHS = 0,
	STATS_COMBAT_SKILLS = 0,
	STATS_PARRIES = 0,
	STATS_WARCRIES = 0,
	STATS_YIELDS = 0,
	STATS_PEOPLE_MOCKED = 0,
	STATS_CRITS_MADE = 0,
	STATS_ROCKS_MINED = 0,
	STATS_CRAFT_SKILLS = 0,
	STATS_ABYSSOR_REMEMBERED = 0,
	STATS_LEECHES_EMBEDDED = 0,
	STATS_HUGS_MADE = 0,
	STATS_CLINGY_PEOPLE = 0,
	STATS_ZIZO_PRAISED = 0,
	STATS_DEADITES_ALIVE = 0,
	STATS_CLERGY_DEATHS = 0,
	STATS_ASSASSINATIONS = 0,
	STATS_ALCOHOL_CONSUMED = 0,
	STATS_ALCOHOLICS = 0,
	STATS_JUNKIES = 0,
	STATS_SHRINE_VALUE = 0,
	STATS_GREEDY_PEOPLE = 0,
	STATS_HUMEN_DEATHS = 0,
	STATS_PLEASURES = 0,
	STATS_SKILLS_DREAMED = 0,
	STATS_ALIVE_TIEFLINGS = 0,
	STATS_PEOPLE_DROWNED = 0,
	STATS_MANA_SPENT = 0,
	STATS_WATER_CONSUMED  = 0,
	STATS_LOCKS_PICKED = 0,
	STATS_SONGS_PLAYED = 0,
	STATS_FOOD_ROTTED = 0,
	STATS_TORTURES = 0,
	STATS_DEADITES_WOKEN_UP = 0,
))

	GLOBAL_LIST_EMPTY(patron_follower_counts)

/datum/controller/subsystem/ticker/proc/gather_roundend_feedback()
	gather_antag_data()
	var/json_file = file("[GLOB.log_directory]/round_end_data.json")
	var/list/file_data = list("escapees" = list("humans" = list(), "silicons" = list(), "others" = list(), "npcs" = list()), "abandoned" = list("humans" = list(), "silicons" = list(), "others" = list(), "npcs" = list()), "ghosts" = list(), "additional data" = list())
	var/num_survivors = 0
	var/num_escapees = 0
	for(var/mob/m in GLOB.mob_list)
		var/escaped
		var/category
		var/list/mob_data = list()
		if(isnewplayer(m))
			continue
		if(m.mind)
			if(m.stat != DEAD && !isbrain(m) && !iscameramob(m))
				num_survivors++
			mob_data += list("name" = m.name, "ckey" = ckey(m.mind.key))
			if(isobserver(m))
				escaped = "ghosts"
			else if(isliving(m))
				var/mob/living/L = m
				mob_data += list("location" = get_area(L), "health" = L.health)
				if(ishuman(L))
					var/mob/living/carbon/human/H = L
					category = "humans"
					mob_data += list("job" = H.mind.assigned_role, "species" = H.dna.species.name)
			else
				category = "others"
				mob_data += list("typepath" = m.type)
		if(!escaped)
			if((m.onCentCom()))
				escaped = "escapees"
				num_escapees++
			else
				escaped = "abandoned"
		if(!m.mind && (!ishuman(m)))
			var/list/npc_nest = file_data["[escaped]"]["npcs"]
			if(npc_nest.Find(initial(m.name)))
				file_data["[escaped]"]["npcs"]["[initial(m.name)]"] += 1
			else
				file_data["[escaped]"]["npcs"]["[initial(m.name)]"] = 1
		else
			if(isobserver(m))
				var/pos = length(file_data["[escaped]"]) + 1
				file_data["[escaped]"]["[pos]"] = mob_data
			else
				if(!category)
					category = "others"
					mob_data += list("name" = m.name, "typepath" = m.type)
				var/pos = length(file_data["[escaped]"]["[category]"]) + 1
				file_data["[escaped]"]["[category]"]["[pos]"] = mob_data
	WRITE_FILE(json_file, json_encode(file_data))
	SSblackbox.record_feedback("nested tally", "round_end_stats", num_survivors, list("survivors", "total"))
	SSblackbox.record_feedback("nested tally", "round_end_stats", num_escapees, list("escapees", "total"))
	SSblackbox.record_feedback("nested tally", "round_end_stats", GLOB.joined_player_list.len, list("players", "total"))
	SSblackbox.record_feedback("nested tally", "round_end_stats", GLOB.joined_player_list.len - num_survivors, list("players", "dead"))
	. = list()
	.[POPCOUNT_SURVIVORS] = num_survivors
	.[POPCOUNT_ESCAPEES] = num_escapees

/datum/controller/subsystem/ticker/proc/gather_antag_data()
	var/team_gid = 1
	var/list/team_ids = list()

	for(var/datum/antagonist/A in GLOB.antagonists)
		if(!A.owner)
			continue

		var/list/antag_info = list()
		antag_info["key"] = A.owner.key
		antag_info["name"] = A.owner.name
		antag_info["antagonist_type"] = A.type
		antag_info["antagonist_name"] = A.name //For auto and custom roles
		antag_info["objectives"] = list()
		antag_info["team"] = list()
		var/datum/team/T = A.get_team()
		if(T)
			antag_info["team"]["type"] = T.type
			antag_info["team"]["name"] = T.name
			if(!team_ids[T])
				team_ids[T] = team_gid++
			antag_info["team"]["id"] = team_ids[T]

		if(A.objectives.len)
			for(var/datum/objective/O in A.objectives)
				var/result = O.check_completion() ? "SUCCESS" : "FAIL"
				antag_info["objectives"] += list(list("objective_type"=O.type,"text"=O.explanation_text,"result"=result))
		SSblackbox.record_feedback("associative", "antagonists", 1, antag_info)

/mob/proc/do_game_over()
	if(SSticker.current_state != GAME_STATE_FINISHED)
		return
	if(client)
		client.verbs += /client/proc/lobbyooc
		client.show_game_over()

/mob/living/do_game_over()
	..()
	adjustEarDamage(0, 6000)
	Stun(6000, 1, 1)
	ADD_TRAIT(src, TRAIT_MUTE, TRAIT_GENERIC)
	walk(src, 0) //stops them mid pathing even if they're stunimmune
	if(isanimal(src))
		var/mob/living/simple_animal/S = src
		S.toggle_ai(AI_OFF)
	if(ishostile(src))
		var/mob/living/simple_animal/hostile/H = src
		H.LoseTarget()
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		H.mode = AI_OFF

/client/proc/show_game_over()
	var/atom/movable/screen/splash/credits/S = new(src, FALSE)
	S.Fade(FALSE,FALSE)
	RollCredits()
	if(GLOB.credits_icons.len)
		for(var/i=0, i<=GLOB.credits_icons.len, i++)
			var/atom/movable/screen/P = new()
			P.layer = SPLASHSCREEN_LAYER+1
			P.appearance = GLOB.credits_icons
			screen += P

/datum/controller/subsystem/ticker/proc/declare_completion()
	set waitfor = FALSE

	log_game("The round has ended.")

	to_chat(world, "<BR><BR><BR><span class='reallybig'>So ends this tale on Azure Peak.</span>")
	get_end_reason()

	var/list/key_list = list()
	for(var/client/C in GLOB.clients)
		if(C.mob)
			SSdroning.kill_droning(C)
			C.mob.playsound_local(C.mob, 'sound/music/roundend.ogg', 100, FALSE)
		if(isliving(C.mob) && C.ckey)
			key_list += C.ckey
//	if(key_list.len)
//		add_roundplayed(key_list)
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H.stat != DEAD)
			if(H.get_triumphs() < 0)
				H.adjust_triumphs(1)
		if(GLOB.round_join_times[H.ckey] && H.job && H.allmig_reward)
			if((GLOB.round_join_times[H.ckey] + 45 MINUTES) < world.time)
				var/datum/job/job = SSjob.GetJob(H.job)
				if(job && job.round_contrib_points)
					to_chat(H, "\n<font color='purple'><b>[job.round_contrib_points]</b> ROUND CONTRIBUTOR POINTS AWARDED. Thank you for playing!</font>")
					add_roundpoints(job.round_contrib_points, H.ckey)
	add_roundplayed(key_list)
//	SEND_SOUND(world, sound(pick('sound/misc/roundend1.ogg','sound/misc/roundend2.ogg')))
//	SEND_SOUND(world, sound('sound/misc/roundend.ogg'))

	for(var/mob/M in GLOB.mob_list)
		M.do_game_over()

	for(var/I in round_end_events)
		var/datum/callback/cb = I
		cb.InvokeAsync()
	LAZYCLEARLIST(round_end_events)

	to_chat(world, "Round ID: [GLOB.rogue_round_id]")

	sleep(5 SECONDS)

	gamemode_report()

	sleep(10 SECONDS)

	players_report()

	CHECK_TICK

	SSgamemode.store_roundend_data()

	CHECK_TICK

	//These need update to actually reflect the real antagonists
	//Print a list of antagonists to the server log
	var/list/total_antagonists = list()
	//Look into all mobs in world, dead or alive
	for(var/datum/antagonist/A in GLOB.antagonists)
		if(!A.owner)
			continue
		if(!(A.name in total_antagonists))
			total_antagonists[A.name] = list()
		total_antagonists[A.name] += "[key_name(A.owner)]"

	CHECK_TICK

	//Now print them all into the log!
	log_game("Antagonists at round end were...")
	for(var/antag_name in total_antagonists)
		var/list/L = total_antagonists[antag_name]
		log_game("[antag_name]s :[L.Join(", ")].")

	CHECK_TICK
	SSdbcore.SetRoundEnd()
	SSpersistence.CollectData()

	//stop collecting feedback during grifftime
	SSblackbox.Seal()

	sleep(10 SECONDS)
	SSvote.initiate_vote("map", "Actors")
	ready_for_reboot = TRUE
	standard_reboot()

/datum/controller/subsystem/ticker/proc/get_end_reason()
	var/end_reason

	if(!check_for_lord())
		end_reason = pick("Without a Monarch, they were doomed to become slaves of Zizo.",
						"Without a Monarch, they were doomed to be eaten by nite creachers.",
						"Without a Monarch, they were doomed to become victims of Gehenna.",
						"Without a Monarch, they were doomed to enjoy a mass-suicide.",
						"Without a Monarch, the Lich made them his playthings.",
						"Without a Monarch, some jealous rival reigned in tyranny.",
						"Without a Monarch, the town was abandoned.")

	if(vampire_werewolf() == "vampire")
		end_reason = "When the Vampires finished sucking the town dry, they moved on to the next one."
	if(vampire_werewolf() == "werewolf")
		end_reason = "The Werevolves formed an unholy clan, marauding Azure Peak until the end of its daes."

	if(SSmapping.retainer.head_rebel_decree)
		end_reason = "The peasant rebels took control of the throne, hail the new community!"


	if(end_reason)
		to_chat(world, span_bigbold("[end_reason]."))
	else
		to_chat(world, span_bigbold("The town has managed to survive another week."))

/datum/controller/subsystem/ticker/proc/gamemode_report()
	var/list/all_teams = list()
	var/list/all_antagonists = list()

	for(var/datum/team/A in GLOB.antagonist_teams)
		if(!A.members)
			continue
		all_teams |= A

	for(var/datum/antagonist/A in GLOB.antagonists)
		if(!A.owner)
			continue
		all_antagonists |= A

	for(var/datum/team/T in all_teams)
		T.roundend_report()
		for(var/datum/antagonist/X in all_antagonists)
			if(X.get_team() == T)
				all_antagonists -= X
		CHECK_TICK

	var/currrent_category
	var/datum/antagonist/previous_category

	sortTim(all_antagonists, GLOBAL_PROC_REF(cmp_antag_category))

	for(var/datum/antagonist/A in all_antagonists)
		if(!A.show_in_roundend)
			continue
		if(A.roundend_category != currrent_category)
			if(previous_category)
				previous_category.roundend_report_footer()
			A.roundend_report_header()
			currrent_category = A.roundend_category
			previous_category = A
		A.roundend_report()

		CHECK_TICK

	if(all_antagonists.len)
		var/datum/antagonist/last = all_antagonists[all_antagonists.len]
		if(last.show_in_roundend)
			last.roundend_report_footer()


	return

/datum/controller/subsystem/ticker/proc/standard_reboot()
	if(ready_for_reboot)
		Reboot("Round ended.", "proper completion")
	else
		CRASH("Attempted standard reboot without ticker roundend completion")

//Common part of the report
/datum/controller/subsystem/ticker/proc/build_roundend_report()
	var/list/parts = list()

	CHECK_TICK

	//Antagonists
	parts += antag_report()

	CHECK_TICK
	//Medals
	parts += medal_report()

	listclearnulls(parts)

	return parts.Join()

/datum/controller/subsystem/ticker/proc/survivor_report(client/C, popcount)
	var/list/parts = list()
	var/station_evacuated = round_end

	if(GLOB.round_id)
		var/statspage = CONFIG_GET(string/roundstatsurl)
		var/info = statspage ? "<a href='?action=openLink&link=[url_encode(statspage)][GLOB.round_id]'>[GLOB.round_id]</a>" : GLOB.round_id
		parts += "[FOURSPACES]Round ID: <b>[info]</b>"
	parts += "[FOURSPACES]Shift Duration: <B>[DisplayTimeText(world.time - SSticker.round_start_time)]</B>"
	var/total_players = GLOB.joined_player_list.len
	if(total_players)
		parts+= "[FOURSPACES]Total Population: <B>[total_players]</B>"
		if(station_evacuated)
			parts += "<BR>[FOURSPACES]Evacuation Rate: <B>[popcount[POPCOUNT_ESCAPEES]] ([PERCENT(popcount[POPCOUNT_ESCAPEES]/total_players)]%)</B>"
		parts += "[FOURSPACES]Survival Rate: <B>[popcount[POPCOUNT_SURVIVORS]] ([PERCENT(popcount[POPCOUNT_SURVIVORS]/total_players)]%)</B>"
		if(SSblackbox.first_death)
			var/list/ded = SSblackbox.first_death
			if(ded.len)
				parts += "[FOURSPACES]First Death: <b>[ded["name"]], [ded["role"]], at [ded["area"]]. Damage taken: [ded["damage"]].[ded["last_words"] ? " Their last words were: \"[ded["last_words"]]\"" : ""]</b>"
			//ignore this comment, it fixes the broken sytax parsing caused by the " above
			else
				parts += "[FOURSPACES]<i>Nobody died this shift!</i>"
	return parts.Join("<br>")

/client/proc/roundend_report_file()
	return "data/roundend_reports/[ckey].html"

/datum/controller/subsystem/ticker/proc/show_roundend_report(client/C, previous = FALSE)
	var/datum/browser/roundend_report = new(C, "roundend")
	roundend_report.width = 800
	roundend_report.height = 600
	var/content
	var/filename = C.roundend_report_file()
	if(!previous)
		var/list/report_parts = list(personal_report(C), GLOB.common_report)
		content = report_parts.Join()
		C.verbs -= /client/proc/show_previous_roundend_report
		fdel(filename)
		text2file(content, filename)
	else
		content = file2text(filename)
	roundend_report.set_content(content)
	roundend_report.stylesheets = list()
//	roundend_report.add_stylesheet("roundend", 'html/browser/roundend.css')
//	roundend_report.add_stylesheet("font-awesome", 'html/font-awesome/css/all.min.css')
	roundend_report.open(FALSE)

/datum/controller/subsystem/ticker/proc/personal_report(client/C, popcount)
	var/list/parts = list()
	var/mob/M = C.mob
	if(M.mind && !isnewplayer(M))
		if(M.stat != DEAD && !isbrain(M))
			if(round_end)
				parts += "<div class='panel greenborder'>"
				parts += "<span class='greentext'>I managed to survive the events on [station_name()] as [M.real_name].</span>"
			else
				parts += "<div class='panel greenborder'>"
				parts += "<span class='greentext'>I managed to survive the events on [station_name()] as [M.real_name].</span>"

		else
			parts += "<div class='panel redborder'>"
			parts += "<span class='redtext'>I did not survive the events on [station_name()]...</span>"
	else
		parts += "<div class='panel stationborder'>"
	parts += "<br>"
	parts += GLOB.survivor_report
	parts += "</div>"

	return parts.Join()

/datum/controller/subsystem/ticker/proc/players_report()
	for(var/client/C in GLOB.clients)
		give_show_playerlist_button(C)

/datum/controller/subsystem/ticker/proc/display_report(popcount)
	GLOB.common_report = build_roundend_report()
	GLOB.survivor_report = survivor_report(popcount)
	for(var/client/C in GLOB.clients)
		show_roundend_report(C, FALSE)
		give_show_report_button(C)
		CHECK_TICK

/datum/controller/subsystem/ticker/proc/medal_report()
	if(GLOB.commendations.len)
		var/list/parts = list()
		parts += span_header("Medal Commendations:")
		for (var/com in GLOB.commendations)
			parts += com
		return "<div class='panel stationborder'>[parts.Join("<br>")]</div>"
	return ""

/datum/controller/subsystem/ticker/proc/antag_report()
	var/list/result = list()
	var/list/all_teams = list()
	var/list/all_antagonists = list()

	for(var/datum/team/A in GLOB.antagonist_teams)
		if(!A.members)
			continue
		all_teams |= A

	for(var/datum/antagonist/A in GLOB.antagonists)
		if(!A.owner)
			continue
		all_antagonists |= A

	for(var/datum/team/T in all_teams)
		result += T.roundend_report()
		for(var/datum/antagonist/X in all_antagonists)
			if(X.get_team() == T)
				all_antagonists -= X
		result += " "//newline between teams
		CHECK_TICK

	var/currrent_category
	var/datum/antagonist/previous_category

	sortTim(all_antagonists, GLOBAL_PROC_REF(cmp_antag_category))

	for(var/datum/antagonist/A in all_antagonists)
		if(!A.show_in_roundend)
			continue
		if(A.roundend_category != currrent_category)
			if(previous_category)
				result += previous_category.roundend_report_footer()
				result += "</div>"
			result += "<div class='panel redborder'>"
			result += A.roundend_report_header()
			currrent_category = A.roundend_category
			previous_category = A
		result += A.roundend_report()
		result += "<br><br>"
		CHECK_TICK

	if(all_antagonists.len)
		var/datum/antagonist/last = all_antagonists[all_antagonists.len]
		result += last.roundend_report_footer()
		result += "</div>"

	return result.Join()

/proc/cmp_antag_category(datum/antagonist/A,datum/antagonist/B)
	return sorttext(B.roundend_category,A.roundend_category)

/datum/controller/subsystem/ticker/proc/give_show_report_button(client/C)
	var/datum/action/report/R = new
	C.player_details.player_actions += R
	R.Grant(C.mob)
	to_chat(C,"<a href='?src=[REF(R)];report=1'>Show roundend report again</a>")

/datum/controller/subsystem/ticker/proc/give_show_playerlist_button(client/C)
	set waitfor = 0
	to_chat(C,"<a href='?src=[C];playerlistrogue=1'>* SHOW PLAYER LIST *</a>")
	to_chat(C,"<a href='byond://?src=[C];viewstats=1'>* View Statistics *</a>")
	C.show_round_stats()
	C.commendsomeone(forced = TRUE)

/datum/action/report
	name = "Show roundend report"
	button_icon_state = "round_end"

/datum/action/report/Trigger()
	if(owner && GLOB.common_report && SSticker.current_state == GAME_STATE_FINISHED)
		SSticker.show_roundend_report(owner.client, FALSE)

/datum/action/report/IsAvailable()
	return 1

/datum/action/report/Topic(href,href_list)
	if(usr != owner)
		return
	if(href_list["report"])
		Trigger()
		return

/proc/printplayer(datum/mind/ply, fleecheck)
	var/jobtext = ""
	if(ply.assigned_role)
		jobtext = " the <b>[ply.assigned_role]</b>"
	var/usede = ply.key
	if(ply.key)
		usede = ckey(ply.key)
		if(ckey(ply.key) in GLOB.anonymize)
//			if(check_whitelist(ckey(ply.key)))
			usede = get_fake_key(ckey(ply.key))
	var/text = "<b>[usede]</b> was <b>[ply.name]</b>[jobtext] and"
	if(ply.current)
		if(ply.current.real_name != ply.name)
			text += " <span class='redtext'>died</span>"
		else
			if(ply.current.stat == DEAD)
				text += " <span class='redtext'>died</span>"
			else
				text += " <span class='greentext'>survived</span>"
//		if(fleecheck)
//			var/turf/T = get_turf(ply.current)
//			if(!T || !is_station_level(T.z))
//				text += " while <span class='redtext'>fleeing the station</span>"
//		if(ply.current.real_name != ply.name)
//			text += " as <b>[ply.current.real_name]</b>"
	to_chat(world, "[text]")

/proc/printplayerlist(list/players,fleecheck)
	var/list/parts = list()

	parts += "<ul class='playerlist'>"
	for(var/datum/mind/M in players)
		parts += "<li>[printplayer(M,fleecheck)]</li>"
	parts += "</ul>"
	return parts.Join()


/proc/printobjectives(list/objectives)
	if(!objectives || !objectives.len)
		return
	var/list/objective_parts = list()
	var/count = 1
	for(var/datum/objective/objective in objectives)
		if(objective.check_completion())
			objective_parts += "<b>Objective #[count]</b>: [objective.explanation_text] <span class='greentext'>Success!</span>"
		else
			objective_parts += "<b>Objective #[count]</b>: [objective.explanation_text] <span class='redtext'>Fail.</span>"
		count++
	return objective_parts.Join("<br>")

/datum/controller/subsystem/ticker/proc/save_admin_data()
	if(IsAdminAdvancedProcCall())
		to_chat(usr, span_adminprefix("Admin rank DB Sync blocked: Advanced ProcCall detected."))
		return
	if(CONFIG_GET(flag/admin_legacy_system)) //we're already using legacy system so there's nothing to save
		return
	else if(load_admins(TRUE)) //returns true if there was a database failure and the backup was loaded from
		return
	sync_ranks_with_db()
	var/list/sql_admins = list()
	for(var/i in GLOB.protected_admins)
		var/datum/admins/A = GLOB.protected_admins[i]
		sql_admins += list(list("ckey" = A.target, "rank" = A.rank.name))
	SSdbcore.MassInsert(format_table_name("admin"), sql_admins, duplicate_key = TRUE)
	var/datum/DBQuery/query_admin_rank_update = SSdbcore.NewQuery("UPDATE [format_table_name("player")] p INNER JOIN [format_table_name("admin")] a ON p.ckey = a.ckey SET p.lastadminrank = a.rank")
	query_admin_rank_update.Execute()
	qdel(query_admin_rank_update)

	//json format backup file generation stored per server
	var/json_file = file("data/admins_backup.json")
	var/list/file_data = list("ranks" = list(), "admins" = list())
	for(var/datum/admin_rank/R in GLOB.admin_ranks)
		file_data["ranks"]["[R.name]"] = list()
		file_data["ranks"]["[R.name]"]["include rights"] = R.include_rights
		file_data["ranks"]["[R.name]"]["exclude rights"] = R.exclude_rights
		file_data["ranks"]["[R.name]"]["can edit rights"] = R.can_edit_rights
	for(var/i in GLOB.admin_datums+GLOB.deadmins)
		var/datum/admins/A = GLOB.admin_datums[i]
		if(!A)
			A = GLOB.deadmins[i]
			if (!A)
				continue
		file_data["admins"]["[i]"] = A.rank.name
	fdel(json_file)
	WRITE_FILE(json_file, json_encode(file_data))

/datum/controller/subsystem/ticker/proc/update_everything_flag_in_db()
	for(var/datum/admin_rank/R in GLOB.admin_ranks)
		var/list/flags = list()
		if(R.include_rights == R_EVERYTHING)
			flags += "flags"
		if(R.exclude_rights == R_EVERYTHING)
			flags += "exclude_flags"
		if(R.can_edit_rights == R_EVERYTHING)
			flags += "can_edit_flags"
		if(!flags.len)
			continue
		var/flags_to_check = flags.Join(" != [R_EVERYTHING] AND ") + " != [R_EVERYTHING]"
		var/datum/DBQuery/query_check_everything_ranks = SSdbcore.NewQuery(
			"SELECT flags, exclude_flags, can_edit_flags FROM [format_table_name("admin_ranks")] WHERE rank = :rank AND ([flags_to_check])",
			list("rank" = R.name)
		)
		if(!query_check_everything_ranks.Execute())
			qdel(query_check_everything_ranks)
			return
		if(query_check_everything_ranks.NextRow()) //no row is returned if the rank already has the correct flag value
			var/flags_to_update = flags.Join(" = [R_EVERYTHING], ") + " = [R_EVERYTHING]"
			var/datum/DBQuery/query_update_everything_ranks = SSdbcore.NewQuery(
				"UPDATE [format_table_name("admin_ranks")] SET [flags_to_update] WHERE rank = :rank",
				list("rank" = R.name)
			)
			if(!query_update_everything_ranks.Execute())
				qdel(query_update_everything_ranks)
				return
			qdel(query_update_everything_ranks)
		qdel(query_check_everything_ranks)
