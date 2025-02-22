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
	message_admins("Skeleton siege event starting...")
	
	// Get only public town areas
	var/list/town_areas = list()
	for(var/area/rogue/A in world)
		// Only spawn in public town areas, avoid rooftops, vault, underground
		if(istype(A, /area/rogue/outdoors/town/square) || 
			istype(A, /area/rogue/outdoors/town/street) ||
			istype(A, /area/rogue/indoors/town/tavern) ||
			istype(A, /area/rogue/indoors/town/shop) ||
			istype(A, /area/rogue/indoors/town/hall))
			town_areas += A
			
	if(!LAZYLEN(town_areas))
		message_admins("WARNING: No valid public town areas found for skeleton siege!")
		return
		
	message_admins("Found [length(town_areas)] valid public town areas")
	
	// Pick up to 3 areas to spawn in
	var/list/chosen_areas = list()
	for(var/i in 1 to min(3, LAZYLEN(town_areas)))
		var/area/rogue/chosen = pick_n_take(town_areas)
		chosen_areas += chosen
		
	message_admins("Chosen [length(chosen_areas)] areas for skeleton spawns")
	
	// Spawn waves of skeletons
	for(var/wave in 1 to waves)
		message_admins("Spawning wave [wave] of skeletons")
		
		for(var/area/rogue/A in chosen_areas)
			var/list/valid_turfs = list()
			
			// Get all valid floor turfs in the area
			for(var/turf/T in A.contents)
				if(isfloorturf(T) && !T.density)
					valid_turfs += T
					
			if(LAZYLEN(valid_turfs) >= spawncount)
				message_admins("Spawning [spawncount] skeletons in [A]")
				for(var/i in 1 to spawncount) 
					var/turf/T = pick(valid_turfs)
					valid_turfs -= T
					if(T)
						var/mob/living/simple_animal/hostile/rogue/skeleton/S = new(T)
						S.faction = list("skeleton")
						
		if(wave < waves)
			sleep(spawn_delay) // Wait before next wave
