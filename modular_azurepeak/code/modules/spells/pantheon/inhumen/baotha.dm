//Baotha's Blessing - T1, reverses overdose effect on a target. (Medieval narcan..... #BanNarcan)



//Blissful Enrapture - T2, basically a crackhead blowing cocaine in your face.



//Numbing Pleasure - T3, removes all pain from self for a period of time. (Similar to Ravox's without any blood-clotting and better pain suppression + good mood buff.)
/obj/effect/proc_holder/spell/invoked/painkiller
	name = "Numbing Pleasure"
	overlay_state = "astrata"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 7
	warnie = "sydwarning"
	sound = 'sound/magic/timestop.ogg'
	invocation = "May you find bliss through your pain!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 20 SECONDS
	miracle = TRUE
	devotion_cost = 50

/obj/effect/proc_holder/spell/invoked/painkiller/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.mob_biotypes & MOB_UNDEAD)
			if(ishuman(target))
				phy.pain_mod *= 0.5	
				return TRUE
			return FALSE	//No, you don't get to feel good. You're a undead mob. Feel bad.
	target.visible_message(span_info("[target] begins to twitch as warmth radiates from them!"), span_notice("The pain from my wounds fade, every new one being a mere, pleasent warmth!"))	//Literally halves your pain-damage.
