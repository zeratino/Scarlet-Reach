/obj/item/clothing/mask/rogue/MiddleClick(mob/user) 
	if((user.zone_selected == BODY_ZONE_PRECISE_NOSE) && (cansnout == TRUE))
		if(snouting == TRUE)
			snouting = FALSE
		else
			snouting = TRUE
		to_chat(user, span_info("I [snouting ? "make space for my snout in \the [src]" : "wear \the [src] tighter"]."))
		if(snouting)
			icon_state = "[initial(icon_state)]_snout"
		else
			icon_state = "[initial(icon_state)]"
		user.update_inv_wear_mask()
	else
		overarmor = !overarmor
		to_chat(user, span_info("I [overarmor ? "wear \the [src] under my hair" : "wear \the [src] over my hair"]."))
		if(overarmor)
			alternate_worn_layer = HOOD_LAYER //Below Hair Layer
		else
			alternate_worn_layer = BACK_LAYER //Above Hair Layer
		user.update_inv_wear_mask()

/obj/item/clothing/mask/rogue
	name = ""
	icon = 'icons/roguetown/clothing/masks.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/masks.dmi'
	body_parts_covered = FACE
	slot_flags = ITEM_SLOT_MASK
	experimental_inhand = FALSE
	experimental_onhip = FALSE
	var/overarmor = TRUE

/obj/item/clothing/mask/rogue/spectacles
	name = "spectacles"
	icon_state = "glasses"
	break_sound = "glassbreak"
	attacked_sound = 'sound/combat/hits/onglass/glasshit.ogg'
	max_integrity = 20
	integrity_failure = 0.5
	resistance_flags = FIRE_PROOF
	body_parts_covered = EYES
	anvilrepair = /datum/skill/craft/armorsmithing
//	block2add = FOV_BEHIND

/obj/item/clothing/mask/rogue/spectacles/golden
	name = "golden spectacles"
	icon_state = "goggles"
	break_sound = "glassbreak"
	attacked_sound = 'sound/combat/hits/onglass/glasshit.ogg'
	max_integrity = 35
	integrity_failure = 0.5
	resistance_flags = FIRE_PROOF
	body_parts_covered = EYES
	anvilrepair = /datum/skill/craft/armorsmithing

/obj/item/clothing/mask/rogue/spectacles/Initialize()
	. = ..()
	AddComponent(/datum/component/spill, null, 'sound/blank.ogg')

/obj/item/clothing/mask/rogue/spectacles/Crossed(mob/crosser)
	if(isliving(crosser) && !obj_broken)
		take_damage(11, BRUTE, "blunt", 1)
	..()

/obj/item/clothing/mask/rogue/equipped(mob/user, slot)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/mask/rogue/dropped(mob/user)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/mask/rogue/eyepatch
	name = "eyepatch"
	desc = "An eyepatch, fitted for the right eye, used by pirates and those with poked eyes, the patch itself makes parrying to perform on the blindspot"
	icon_state = "eyepatch"
	max_integrity = 50
	armor = ARMOR_MASK_EYEPATCH
	body_parts_covered = RIGHT_EYE
	integrity_failure = 0.5
	block2add = FOV_RIGHT
	body_parts_covered = EYES
	sewrepair = TRUE

/obj/item/clothing/mask/rogue/eyepatch/left
	desc = "An eyepatch, fitted for the left eye, used by pirates and those with poked eyes, the patch itself makes parrying to perform on the blindspot"
	icon_state = "eyepatch_l"
	body_parts_covered = LEFT_EYE
	block2add = FOV_LEFT

/obj/item/clothing/mask/rogue/lordmask
	name = "golden halfmask"
	desc = "Half of your face turned gold."
	icon_state = "lmask"
	sellprice = 50
	anvilrepair = /datum/skill/craft/armorsmithing
	resistance_flags = FIRE_PROOF

/obj/item/clothing/mask/rogue/lordmask/l
	icon_state = "lmask_l"

/obj/item/clothing/mask/rogue/lordmask/tarnished
	name = "tarnished golden halfmask"
	desc = "Runes and wards, meant for daemons; the gold has somehow rusted in unnatural, impossible agony. The gold is now worthless, but that is not why the Naledi wear them."
	sellprice = 20

/obj/item/clothing/mask/rogue/wildguard
	name = "wild guard"
	desc = "A mask shaped after the snarling beasts of Dendor."
	icon_state = "wildguard"
	blocksound = PLATEHIT
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	max_integrity = 100
	resistance_flags = FIRE_PROOF
	armor = ARMOR_MASK_METAL
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	flags_inv = HIDEFACE|HIDESNOUT
	body_parts_covered = FACE
	block2add = FOV_BEHIND
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/mask/rogue/facemask
	name = "iron mask"
	desc = "An iron mask which protects the eyes, nose and mouth while also obscuring the face it."
	icon_state = "imask"
	max_integrity = 100
	blocksound = PLATEHIT
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	resistance_flags = FIRE_PROOF
	armor = ARMOR_MASK_METAL
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	flags_inv = HIDEFACE|HIDESNOUT
	body_parts_covered = FACE
	block2add = FOV_BEHIND
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	experimental_onhip = TRUE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/mask/rogue/facemask/aalloy
	name = "decrepit mask"
	desc = "A decrepit creepy old mask. Aeon's grasp is upon it."
	icon_state = "ancientmask"
	max_integrity = 75
	smeltresult = /obj/item/ingot/aalloy

/obj/item/clothing/mask/rogue/facemask/copper
	name = "copper mask"
	icon_state = "cmask"
	desc = "A heavy copper mask which protects the eyes, nose and mouth yet not all that effectively while also obscuring the face it."
	armor = ARMOR_MASK_METAL_BAD
	smeltresult = /obj/item/ingot/copper

/obj/item/clothing/mask/rogue/facemask/hound
	name = "hound mask"
	desc = "An mask of iron with a shape of a hound's muzzle which protects the eyes, nose and mouth while also obscuring the face it."
	icon_state = "imask_hound"
	max_integrity = 100
	blocksound = PLATEHIT
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	resistance_flags = FIRE_PROOF
	armor = ARMOR_MASK_METAL
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	flags_inv = HIDEFACE|HIDESNOUT
	body_parts_covered = FACE
	block2add = FOV_BEHIND
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	experimental_onhip = TRUE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/mask/rogue/facemask/psydonmask
	name = "Silver mask"
	desc = "A silver mask, forever locked in a rigor of uncontestable joy. The Order of Saint Xylix can't decide on whether it's meant to represent Psydon's 'mirthfulness,' 'theatricality,' or the unpredictable melding of both."
	icon_state = "psydonmask"
	item_state = "psydonmask"

/obj/item/clothing/mask/rogue/facemask/prisoner
	name = "cursed mask"
	desc = "An iron mask that seals around the head, making it impossible to remove. It seems to be enchanted with some kind of vile magic..."
	body_parts_covered = NONE //So that surgery can be done through the mask.
	var/active_item
	var/bounty_amount

/obj/item/clothing/mask/rogue/facemask/prisoner/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/mask/rogue/facemask/prisoner/dropped(mob/living/carbon/human/user)
	. = ..()
	REMOVE_TRAIT(user, TRAIT_PACIFISM, "cursedmask")
	REMOVE_TRAIT(user, TRAIT_SPELLCOCKBLOCK, "cursedmask")
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/mask/rogue/facemask/prisoner/proc/timerup(mob/living/carbon/human/user)
	REMOVE_TRAIT(user, TRAIT_PACIFISM, "cursedmask")
	REMOVE_TRAIT(user, TRAIT_SPELLCOCKBLOCK, "cursedmask")
	visible_message(span_warning("The cursed mask opens with a click, falling off of [user]'s face and clambering apart on the ground, their penance complete."))
	say("YOUR PENANCE IS COMPLETE.")
	for(var/name in GLOB.outlawed_players)
		if(user.real_name == name)
			GLOB.outlawed_players -= user.real_name
			priority_announce("[user.real_name] has completed their penance. Justice has been served in the eyes of Ravox.", "PENANCE", 'sound/misc/bell.ogg')
	playsound(src.loc, pick('sound/items/pickgood1.ogg','sound/items/pickgood2.ogg'), 5, TRUE)
	if(QDELETED(src))
		return
	qdel(src)
	

/obj/item/clothing/mask/rogue/facemask/prisoner/equipped(mob/living/user, slot)
	. = ..()
	if(active_item)
		return
	else if(slot == SLOT_WEAR_MASK)
		active_item = TRUE
		to_chat(user, span_warning("This accursed mask pacifies me!"))
		ADD_TRAIT(user, TRAIT_PACIFISM, "cursedmask")
		ADD_TRAIT(user, TRAIT_SPELLCOCKBLOCK, "cursedmask")
		if(HAS_TRAIT(user, TRAIT_RITUALIST))
			user.apply_status_effect(/datum/status_effect/debuff/ritesexpended)
		var/timer = 5 MINUTES //Base timer is 5 minutes, additional time added per bounty amount

		if(bounty_amount >= 10)
			var/additional_time = bounty_amount * 0.1 // 10 mammon = 1 minute
			additional_time = round(additional_time)
			timer += additional_time MINUTES

		var/timer_minutes = timer / 600

		addtimer(CALLBACK(src, PROC_REF(timerup), user), timer)
		say("YOUR PENANCE WILL BE COMPLETE IN [timer_minutes] MINUTES.")
	return

/obj/item/clothing/mask/rogue/facemask/steel
	name = "steel mask"
	desc = "A mask of steel which protects the eyes, nose and mouth while also obscuring the face it."
	icon_state = "smask"
	max_integrity = 200
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/mask/rogue/facemask/steel/paalloy
	name = "ancient mask"
	desc = "A mask forged of ancient alloys. Aeon's grasp has been lifted from its form."
	icon_state = "ancientmask"


/obj/item/clothing/mask/rogue/facemask/steel/hound
	name = "steel hound mask"
	desc = "A mask of steel with a shape of a hound's muzzle which protects the eyes, nose and mouth while also obscuring the face it."
	icon_state = "smask_hound"

/obj/item/clothing/mask/rogue/facemask/goldmask
	name = "gold mask"
	icon_state = "goldmask"
	max_integrity = 150
	sellprice = 100
	smeltresult = /obj/item/ingot/gold

/obj/item/clothing/mask/rogue/shepherd
	name = "halfmask"
	icon_state = "shepherd"
	flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDESNOUT
	body_parts_covered = NECK|MOUTH
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	experimental_onhip = TRUE
	sewrepair = TRUE

/obj/item/clothing/mask/rogue/shepherd/ComponentInitialize()
	AddComponent(/datum/component/adjustable_clothing, NECK, null, null, 'sound/foley/equip/rummaging-03.ogg', null, (UPD_HEAD|UPD_MASK))	//Standard mask

/obj/item/clothing/mask/rogue/shepherd/shadowmask
	name = "purple halfmask"
	icon_state = "shadowmask"
	desc = "For when one wants to conceal their face while performing dastardly deeds in the name of the crown."

/obj/item/clothing/mask/rogue/physician
	name = "plague mask"
	desc = "What better laboratory than the blood-soaked battlefield?"
	icon_state = "physmask"
	flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDESNOUT
	body_parts_covered = FACE|EYES|MOUTH
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	sewrepair = TRUE


/obj/item/clothing/mask/rogue/skullmask
	name = "skull mask"
	desc = "A mask in the shape of a skull, designed to terrify."
	icon_state = "skullmask"
	max_integrity = 100
	blocksound = PLATEHIT
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	resistance_flags = FIRE_PROOF
	armor = ARMOR_HEAD_BAD
	prevent_crits = null
	flags_inv = HIDEFACE|HIDESNOUT
	body_parts_covered = FACE
	block2add = FOV_BEHIND
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	experimental_onhip = TRUE
	smeltresult = /obj/item/natural/bone

/obj/item/clothing/mask/rogue/ragmask
	name = "rag mask"
	icon_state = "ragmask"
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	body_parts_covered = NECK|MOUTH
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	experimental_onhip = TRUE
	sewrepair = TRUE
	cansnout = TRUE

/obj/item/clothing/mask/rogue/ragmask/ComponentInitialize()
	AddComponent(/datum/component/adjustable_clothing, NECK, null, null, 'sound/foley/equip/rummaging-03.ogg', null, (UPD_HEAD|UPD_MASK))	//Standard mask

/obj/item/clothing/mask/rogue/ragmask/red //pre-dyed mask for NPCs
	color = CLOTHING_RED

/obj/item/clothing/mask/rogue/lordmask/naledi
	name = "war scholar's mask"
	item_state = "naledimask"
	icon_state = "naledimask"
	desc = "Runes and wards, meant for daemons; the gold has somehow rusted in unnatural, impossible agony. The most prominent of these etchings is in the shape of the Naledian psycross. Armored to protect the wearer's face."
	max_integrity = 100
	armor = ARMOR_MASK_METAL
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	sellprice = 0

/obj/item/clothing/mask/rogue/exoticsilkmask
	name = "exotic silk mask"
	icon_state = "exoticsilkmask"
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	body_parts_covered = NECK|MOUTH
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	sewrepair = TRUE
	adjustable = CAN_CADJUST
	toggle_icon_state = FALSE

/obj/item/clothing/mask/rogue/exoticsilkmask/ComponentInitialize()
	AddComponent(/datum/component/adjustable_clothing, NECK, null, null, 'sound/foley/equip/rummaging-03.ogg', null, (UPD_HEAD|UPD_MASK))	//Standard mask

/obj/item/clothing/mask/rogue/blindfold
	name = "blindfold"
	desc = "A strip of cloth tied around the eyes to block vision."
	icon_state = "blindfold"
	item_state = "blindfold"
	body_parts_covered = EYES
	sewrepair = TRUE
	tint = 3
	mob_overlay_icon = 'icons/mob/clothing/eyes.dmi'
	icon = 'icons/obj/clothing/glasses.dmi'

/obj/item/clothing/mask/rogue/blindfold/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_MASK)
		user.become_blind("blindfold_[REF(src)]")

/obj/item/clothing/mask/rogue/blindfold/dropped(mob/living/carbon/human/user)
	..()
	user.cure_blind("blindfold_[REF(src)]")

/obj/item/clothing/mask/rogue/duelmask
	name = "duelist's mask"
	desc = "A black cloth mask for those masked duelists, doesn't grant any protection, but covers your eyes, and your identity... somehow."
	icon_state = "duelmask"
	flags_inv = HIDEFACE
	body_parts_covered = EYES
	slot_flags = ITEM_SLOT_MASK
	color = COLOR_ALMOST_BLACK	
	detail_tag = "_detail"
	detail_color = COLOR_SILVER
	sewrepair = TRUE
