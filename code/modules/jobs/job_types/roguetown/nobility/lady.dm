/datum/job/roguetown/lady
	title = "Suitor"
	flag = LADY
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_NO_CONSTRUCT
	advclass_cat_rolls = list(CTAG_CONSORT = 20)
	tutorial = "You are a noble from a foreign court who has travelled to Azure Peak in order to win the hand of Azuria's most eligible bachelor and secure a political ally for your house. Competition is fierce, and it seems you're not the only one vying for the duke's favor..."

	outfit = /datum/outfit/job/roguetown/lady

	display_order = JDO_LADY
	give_bank_account = 40
	noble_income = 20
	min_pq = 5
	max_pq = null
	round_contrib_points = 3

/datum/job/roguetown/lady/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(ishuman(H))
		var/mob/living/carbon/human/Q = H
		Q.advsetup = 1
		Q.invisibility = INVISIBILITY_MAXIMUM
		Q.become_blind("advsetup")