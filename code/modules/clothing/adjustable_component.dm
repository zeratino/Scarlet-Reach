/*
		Component used in place of AdjustClothes() proc where it's meant to be a toggle between two simple states with changes in basic flags.
		It hooks into attack_right and toggles between states, swapping flags, FOV fields and coverage as needed.
		Note: The component assumes the item's default state (sprite & flags wise) is "ON". IE visor closed, hood on, coif on, mask on etc.
		Make sure to adjust your inv flags & body coverage accordingly.
*/
/datum/component/adjustable_clothing
	///Body coverage zones (For armor) it should have when open. body_coverage_dynamic will take these.
	var/flags_open
	///flags_inv the object will have if toggled open.
	var/flags_inv_open
	///flags_cover the object will have if toggled open. This is NOT armor. This is for covering your mouth for eating / face for identity, etc. 
	var/flags_cover_open
	///Dynamic variable that keeps track of any missing coverage zones and applies them to either applicable state. Do not change this.
	var/flags_removed
	///Sound to be played on toggle.
	var/toggle_sound
	///Whether the object is toggled open or not. Defaults to FALSE aka it's "closed".
	var/toggled_open = FALSE
	///The block2add the item is meant to have on toggle.
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
	C.update_icon()
	H.update_fov_angles()

//We force it closed to make sure we can't equip an opened item if one IS on the ground somehow.
/datum/component/adjustable_clothing/proc/on_equip(datum/source, mob/user, slot)
	var/obj/item/clothing/C = parent
	if(!ishuman(C.loc))
		return
	toggle_closed(C, forced = TRUE)
	var/mob/living/carbon/human/H = C.loc
	H.update_fov_angles()

//We force it closed to make sure an opened item cannot be dropped.
//In both of these cases it's to prevent fringe bugs with coverage.
/datum/component/adjustable_clothing/proc/on_drop(datum/source, mob/user)
	var/obj/item/clothing/C = parent
	if(!ishuman(C.loc))
		return
	toggle_closed(C, forced = TRUE)
	var/mob/living/carbon/human/H = C.loc
	H.update_fov_angles()

/datum/component/adjustable_clothing/proc/toggle_open(obj/item/clothing/C, forced = FALSE)
	if(!forced)	//We skip this if we're equipping or dropping the item to prevent coverage glitches.
		if(!(C.body_parts_covered_dynamic == C.body_parts_covered))	//Our coverage does not match.
			flags_removed = (C.body_parts_covered - C.body_parts_covered_dynamic)	//We store the difference.
		else if(C.body_parts_covered_dynamic == C.body_parts_covered && C.body_parts_covered_dynamic & flags_removed)	//We match AND _dynamic has our stored flags. Means the coverage was repaired.
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
		if(!(C.body_parts_covered_dynamic == flags_open))
			flags_removed = flags_open - C.body_parts_covered_dynamic
		else if(C.body_parts_covered_dynamic == flags_open && C.body_parts_covered_dynamic & flags_removed)
			flags_removed = null
	C.body_parts_covered_dynamic = C.body_parts_covered
	C.body_parts_covered_dynamic &= ~flags_removed
	C.flags_inv = initial(C.flags_inv)
	C.flags_cover = initial(C.flags_cover)
	C.block2add = initial(C.block2add)
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

/datum/component/adjustable_clothing/head/standard_helmet/sallet
	flags_open = HEAD|EARS|HAIR
	flags_inv_open = null
	flags_cover_open = null
	fov_open = null
/datum/component/adjustable_clothing/head/standard_helmet/otavan
	flags_inv_open = HIDEEARS

/datum/component/adjustable_clothing/head/standard_hood
	toggle_sound = 'sound/foley/equip/cloak (3).ogg'
	flags_open = NECK
	flags_inv_open = null
	flags_cover_open = null
	fov_open = null

/datum/component/adjustable_clothing/head/standard_mask
	toggle_sound = 'sound/foley/equip/rummaging-03.ogg'
	flags_open = NECK
	flags_inv_open = null
	flags_cover_open = null
	fov_open = null

/datum/component/adjustable_clothing/head/standard_coif
	toggle_sound = null
	flags_open = NECK
	flags_inv_open = null
	flags_cover_open = null
	fov_open = null

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
	flags_open = NECK|MOUTH
	flags_inv_open = null
	flags_cover_open = null
	fov_open = null

