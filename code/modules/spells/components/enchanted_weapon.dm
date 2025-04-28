#define DEFAULT_DURATION 15 MINUTES
#define SEARING_BLADE_ENCHANT 1
#define FORCE_BLADE_ENCHANT 2
#define SEARING_BLADE_DAMAGE 8
#define FORCE_BLADE_FORCE 5
#define SEARING_FILTER "searing_blade"
#define FORCE_FILTER "force_blade"

/* Component used for adding enchantment from the enchant weapon spell
 Three types of enchantments are available:
 1. Searing Blade: Applies 8 burn damage through armor, per strike
 2. Force Blade: Increases the force of the weapon by 5.
 The enchantment will lasts for 15 minutes, and will automatically refresh in the hand of an Arcyne user.
 There used to be a concept for a blade to set people on fire - but it was too broken if people didn't insta pat
*/

/datum/component/enchanted_weapon
	var/endtime = null // How long till the conjured item disappear (Don't use duration it is messed up)
	var/allow_refresh = TRUE // If TRUE, the item will refresh its duration when held by a X user
	var/refresh_skill = /datum/skill/magic/arcane // The skill that will be used to refresh the item
	var/overridden_duration = null
	var/mob/living/current_user = null // The current user of the item
	var/enchant_type = FORCE_BLADE_ENCHANT // The type of enchantment

/datum/component/enchanted_weapon/Initialize(duration_override, allow_refresh_override, refresh_skill_override, var/mob/living/owner_override, enchant_type_override)
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE
	var/obj/item/I = parent

	to_chat(world, span_warning("[I] is enchanted!, [duration_override], [allow_refresh_override], [refresh_skill_override], [owner_override], [enchant_type_override]"))	

	if(duration_override)
		endtime = world.time += duration_override
	else
		endtime = world.time += DEFAULT_DURATION
	if(allow_refresh_override)
		allow_refresh = allow_refresh_override
	if(refresh_skill_override)
		refresh_skill = refresh_skill_override
	if(owner_override)
		current_user = owner_override
	if(enchant_type_override)
		enchant_type = enchant_type_override
	if(enchant_type == FORCE_BLADE_ENCHANT)
		I.force += FORCE_BLADE_FORCE
		I.force_wielded += FORCE_BLADE_FORCE
		var/force_blade_filter = I.get_filter(FORCE_FILTER)
		if(!force_blade_filter)
			I.add_filter(FORCE_FILTER, 2, list("type" = "outline", "color" = GLOW_COLOR_DISPLACEMENT, "alpha" = 200, "size" = 1))
	else if(enchant_type == SEARING_BLADE_ENCHANT)
		var/searing_blade_filter = I.get_filter(SEARING_FILTER)
		if(!searing_blade_filter)
			I.add_filter(SEARING_FILTER, 2, list("type" = "outline", "color" = GLOW_COLOR_FIRE, "alpha" = 200, "size" = 1))


	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(on_equip))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(on_unequip))
	RegisterSignal(parent, COMSIG_ITEM_AFTERATTACK, PROC_REF(item_afterattack))

	START_PROCESSING(SSdcs, src)

/datum/component/enchanted_weapon/process()
	if(endtime <= world.time)
		if(isliving(current_user) && refresh_skill)
			var/has_right_skill = current_user.mind.get_skill_level(refresh_skill)
			if(has_right_skill)
				if(overridden_duration)
					endtime += overridden_duration
				else
					endtime += DEFAULT_DURATION
				return
		if(current_user)
			to_chat(current_user, span_warning("The enchantment on [parent] fades away"))
		remove()
		qdel(src)
		return

/datum/component/enchanted_weapon/proc/on_equip(datum/source, mob/user, slot)
	if(isliving(user))
		current_user = user

/datum/component/enchanted_weapon/proc/on_unequip(datum/source, mob/user, slot)
	current_user = null

// Called when the enchantment is removed
/datum/component/enchanted_weapon/proc/remove()
	var/obj/item/I = parent
	if(enchant_type == FORCE_BLADE_ENCHANT)
		I.force -= FORCE_BLADE_FORCE
		I.force_wielded -= FORCE_BLADE_FORCE
		I.remove_filter(FORCE_FILTER)
	else if(enchant_type == SEARING_BLADE_ENCHANT)
		I.remove_filter(SEARING_FILTER)

/datum/component/enchanted_weapon/proc/on_examine(datum/source, mob/user, list/examine_list)
	if(enchant_type == SEARING_BLADE_ENCHANT)
		examine_list += "This weapon is enchanted with a searing blade enchantment."
	else if(enchant_type == FORCE_BLADE_ENCHANT)
		examine_list += "This weapon is enchanted with a force blade enchantment."
	var/remaining_minutes = round((endtime - world.time) / 600)
	examine_list += "The enchantment will last for [remaining_minutes] more minutes."

/datum/component/enchanted_weapon/proc/item_afterattack(obj/item/source, atom/target, mob/user, proximity_flag, click_parameters)
	if(enchant_type == SEARING_BLADE_ENCHANT)
		if(isliving(target))
			var/mob/living/M = target
			M.adjustFireLoss(SEARING_BLADE_DAMAGE)
			to_chat(M, span_warning("Flames leaps from [source] and singes you!"))
			// Permanent temporary solution until I figure out how to hack a dynamic on mob sprites
			// Bypass parry & dodge btw.

#undef DEFAULT_DURATION
