/datum/component/adjustable_clothing
	var/flags_open
	var/flags_closed
	var/flags_inv_closed
	var/flags_inv_open
	var/flags_cover_closed
	var/flags_cover_open
	var/flags_removed
	var/toggle_sound
	var/toggled_open = FALSE
	var/fov_closed = null
	var/fov_open = null

/datum/component/adjustable_clothing/Initialize()
	if(!isclothing(parent))
		return COMPONENT_INCOMPATIBLE
	RegisterSignal(parent, COMSIG_ATOM_ATTACK_RIGHT, PROC_REF(on_attack_right))
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(on_equip))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(on_drop))
	
/datum/component/adjustable_clothing/proc/on_attack_right(mob/user)
	var/obj/item/clothing/C = parent
	if(!ishuman(C.loc))
		return
	var/mob/living/carbon/human/H = C.loc
	if(toggled_open)	//We're open, so we'll close
		toggle_closed(C)
	else
		toggle_open(C)
	if(toggle_sound)
		playsound(C, toggle_sound, 50, TRUE, -1)
		to_chat(world,"playing a sound [toggle_sound]")
	C.update_icon()
	H.update_fov_angles()

/datum/component/adjustable_clothing/proc/on_equip(datum/source, mob/user, slot)
	var/obj/item/clothing/C = parent
	if(!ishuman(C.loc))
		return
	toggle_closed(C, forced = TRUE)
	var/mob/living/carbon/human/H = C.loc
	H.update_fov_angles()

/datum/component/adjustable_clothing/proc/on_drop(datum/source, mob/user)
	var/obj/item/clothing/C = parent
	if(!ishuman(C.loc))
		return
	toggle_closed(C, forced = TRUE)
	var/mob/living/carbon/human/H = C.loc
	H.update_fov_angles()

/datum/component/adjustable_clothing/proc/toggle_open(obj/item/clothing/C, forced = FALSE)
	if(!forced)
		if(!(C.body_parts_covered_dynamic == flags_closed) && !flags_removed)
			flags_removed = flags_closed - C.body_parts_covered_dynamic
		else if(C.body_parts_covered_dynamic == flags_closed && C.body_parts_covered_dynamic & flags_removed)
			flags_removed = null
	C.body_parts_covered_dynamic = flags_open
	C.body_parts_covered_dynamic &= ~flags_removed
	C.flags_inv = flags_inv_open
	C.flags_cover = flags_cover_open
	C.block2add = fov_open
	C.icon_state = "[initial(C.icon_state)]_t"
	toggled_open = TRUE

/datum/component/adjustable_clothing/proc/toggle_closed(obj/item/clothing/C, forced = FALSE)
	if(!forced)
		if(!(C.body_parts_covered_dynamic == flags_open) && !flags_removed)
			flags_removed = flags_open - C.body_parts_covered_dynamic
		else if(C.body_parts_covered_dynamic == flags_open && C.body_parts_covered_dynamic & flags_removed)
			flags_removed = null
	C.body_parts_covered_dynamic = flags_closed
	C.body_parts_covered_dynamic &= ~flags_removed
	C.flags_inv = flags_inv_closed
	C.flags_cover = flags_cover_closed
	C.block2add = fov_closed
	C.icon_state = "[initial(C.icon_state)]"
	toggled_open = FALSE

/datum/component/adjustable_clothing/head/on_attack_right(mob/user)
	. = ..()
	var/obj/item/clothing/C = parent
	if(!ishuman(C.loc))
		return
	var/mob/living/carbon/human/H = C.loc
	H.update_inv_head()
	H.update_inv_wear_mask()

/datum/component/adjustable_clothing/head/standard_helmet
	toggle_sound = 'sound/items/visor.ogg'
	flags_open = HEAD|EARS|HAIR
	flags_inv_open = HIDEEARS|HIDEHAIR
	flags_cover_open = null
	fov_open = null

	flags_closed = FULL_HEAD
	flags_inv_closed = HIDEEARS|HIDEFACE|HIDEHAIR|HIDESNOUT
	flags_cover_closed = HEADCOVERSEYES | HEADCOVERSMOUTH
	fov_closed = FOV_BEHIND

/datum/component/adjustable_clothing/head/standard_helmet/sallet
	flags_open = HEAD|EARS|HAIR
	flags_inv_open = null
	flags_cover_open = null
	fov_open = null

	flags_closed = HEAD|EARS|HAIR|NOSE|EYES
	flags_inv_closed = HIDEFACE|HIDESNOUT
	flags_cover_closed = HEADCOVERSEYES
	fov_closed = FOV_BEHIND

/datum/component/adjustable_clothing/head/standard_helmet/otavan
	flags_inv_open = HIDEEARS

/datum/component/adjustable_clothing/head/standard_helmet/zizo
	flags_inv_closed = HIDEFACE|HIDESNOUT|HIDEEARS

/datum/component/adjustable_clothing/head/standard_hood
	toggle_sound = 'sound/foley/equip/cloak (3).ogg'
	flags_open = NECK
	flags_inv_open = null
	flags_cover_open = null
	fov_open = null

	flags_closed = NECK|HAIR|EARS|HEAD
	flags_inv_closed = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	flags_cover_closed = null
	fov_closed = FOV_BEHIND

/datum/component/adjustable_clothing/head/standard_hood/hijab	//Does not hide face when "closed"
	flags_inv_closed = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR
	fov_open = null
	fov_closed = null

/datum/component/adjustable_clothing/head/standard_mask
	toggle_sound = 'sound/foley/equip/rummaging-03.ogg'
	flags_open = NECK
	flags_inv_open = null
	flags_cover_open = null
	fov_open = null

	flags_closed = NECK|MOUTH
	flags_inv_closed = HIDEFACE|HIDEFACIALHAIR|HIDESNOUT
	flags_cover_closed = null
	fov_closed = null

/datum/component/adjustable_clothing/head/standard_coif
	toggle_sound = null
	flags_open = NECK
	flags_inv_open = null
	flags_cover_open = null
	fov_open = null

	flags_closed = NECK|HAIR|EARS|HEAD
	flags_inv_closed = HIDEHAIR
	flags_cover_closed = null
	fov_closed = null

/datum/component/adjustable_clothing/head/standard_coif/on_attack_right(mob/user)
	. = ..()
	var/obj/item/clothing/C = parent
	if(!ishuman(C.loc))
		return
	var/mob/living/carbon/human/H = C.loc
	H.update_inv_neck()

/datum/component/adjustable_clothing/head/standard_coif/chain
	toggle_sound = 'sound/foley/equip/equip_armor_chain.ogg'

/datum/component/adjustable_clothing/head/standard_coif/chain/mantle
	flags_open = NECK
	flags_inv_open = null
	flags_cover_open = null
	fov_open = null

	flags_closed = NECK|MOUTH
	flags_inv_closed = HIDEFACE|HIDEFACIALHAIR|HIDESNOUT
	flags_cover_closed = null
	fov_closed = null

