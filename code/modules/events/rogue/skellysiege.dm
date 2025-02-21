/datum/round_event_control/rogue/skeleton_siege
	name = "skellysiege"
	typepath = /datum/round_event/rogue/skeleton_siege
	weight = 10
	max_occurrences = 999
	min_players = 0
	req_omen = TRUE
	todreq = list("dusk", "night", "dawn", "day")
	earliest_start = 0 // Allow immediate start for dark chant
	var/last_siege = 0

/datum/round_event/rogue/skeleton_siege
	announceWhen	= 1
	var/spawncount = 5  // Number of skeletons per area
	var/spawn_delay = 30 SECONDS
	var/waves = 3

/datum/round_event/rogue/skeleton_siege/setup()
	return TRUE

/datum/round_event/rogue/skeleton_siege/start()
	if(!SSticker.mode)
		return
	var/datum/game_mode/chaosmode/C = SSticker.mode
	if(!istype(C))
		return
	
	// Enable skeletons for ghost respawns
	C.skeletons = TRUE
	addtimer(CALLBACK(C, TYPE_PROC_REF(/datum/game_mode/chaosmode, reset_skeletons)), rand(4 MINUTES, 8 MINUTES))
	for(var/mob/dead/observer/O in GLOB.player_list)
		addtimer(CALLBACK(O, TYPE_PROC_REF(/mob/dead/observer, horde_respawn)), 1)
	
	// Spawn initial wave of NPC skeletons
	spawn_wave()
	
	// Schedule additional waves
	for(var/i in 1 to waves)
		addtimer(CALLBACK(src, PROC_REF(spawn_wave)), spawn_delay * i)

/datum/round_event/rogue/skeleton_siege/proc/spawn_wave()
	// Get all town areas
	var/list/town_areas = list()
	for(var/area/A in world)
		if(istype(A, /area/rogue/indoors/town) || istype(A, /area/rogue/outdoors/town))
			var/area/rogue/R = A
			if(R.town_area)
				town_areas += R
	
	if(!LAZYLEN(town_areas))
		message_admins("WARNING: No valid town areas found for skeleton siege NPCs")
		return
	
	// Pick 3 different areas for this wave
	var/list/chosen_areas = list()
	for(var/i in 1 to min(3, LAZYLEN(town_areas)))
		var/area/rogue/chosen = pick_n_take(town_areas)
		chosen_areas += chosen
	
	// Spawn exactly 5 skeletons in each chosen area
	for(var/area/rogue/A in chosen_areas)
		var/list/valid_turfs = list()
		
		// Get all valid floor turfs in the area
		for(var/turf/T in A.contents)
			if(isfloorturf(T))
				valid_turfs += T
		
		if(LAZYLEN(valid_turfs) >= spawncount) // Only spawn if we have enough valid turfs
			for(var/i in 1 to spawncount)
				var/turf/T = pick(valid_turfs)
				valid_turfs -= T // Remove used turf to prevent stacking
				if(T)
					new /mob/living/simple_animal/hostile/rogue/skeleton(T)
					sleep(0.2) // Small delay between spawns to prevent server hitching
