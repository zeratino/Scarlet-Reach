/obj/effect/proc_holder/spell/self/conjure_armor
	name = "Conjure Armor"
	desc = "Conjure a full set of light armor and attempts to equip it on someone \n\
	The armor lasts for 15 minutes - but will refresh its duration infinitely when equipped on a Arcyne user.\n\
	At 12 int or above, conjure hardened leather grade armor for the body, otherwise conjure leather armor.\n\
	Armor will only be conjured where the target is not wearing any. Masks, Cloaks & Mouthpiece not included."
	overlay_state = "conjure_armor"
	sound = list('sound/magic/whiteflame.ogg')

	releasedrain = 50
	chargedrain = 1
	chargetime = 3 SECONDS
	no_early_release = TRUE
	recharge_time = 10 MINUTES // Not meant to be spammed

	warnie = "spellwarning"
	no_early_release = TRUE
	antimagic_allowed = FALSE
	charging_slowdown = 3
	cost = 2
	spell_tier = 2 // Spellblade tier.

	invocation = "Cladum Fati!" //destiny's defeat!
	invocation_type = "shout"
	glow_color = GLOW_COLOR_METAL
	glow_intensity = GLOW_INTENSITY_MEDIUM

	var/obj/item/clothing/conjured_armor = null

/obj/effect/proc_holder/spell/self/conjure_armor/cast(list/targets, mob/living/user = usr)
	var/mob/living/carbon/human/H = user
	var/targetac = H.highest_ac_worn()
	if(targetac > 1)
		to_chat(user, span_warning("I must be wearing lighter armor!"))
		revert_cast()
		return FALSE
	if(user.get_num_arms() <= 0)
		to_chat(user, span_warning("I don't have any usable hands!"))
		revert_cast()
		return FALSE
	if(src.conjured_armor)
		qdel(src.conjured_armor)
	if(H.wear_ring)
		to_chat(user, span_warning("My ring finger must be free!"))
		revert_cast()
		return FALSE

	user.visible_message("[user] existence briefly jitters, conjuring protection from doomed fates!")
	var/ring = /obj/item/clothing/ring/fate_weaver
	var/obj/item/conjured_armor = new ring(user)
	user.equip_to_slot_or_del(conjured_armor, SLOT_RING)
	if(!QDELETED(conjured_armor))
		conjured_armor.AddComponent(/datum/component/conjured_item, GLOW_COLOR_ARCANE)
	return TRUE

/obj/effect/proc_holder/spell/self/conjure_armor/miracle
	associated_skill = /datum/skill/magic/holy
