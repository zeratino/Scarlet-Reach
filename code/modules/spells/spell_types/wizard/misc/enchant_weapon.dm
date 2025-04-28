#define ENCHANT_DURATION 15 MINUTES

/obj/effect/proc_holder/spell/invoked/enchant_weapon
	name = "Enchant Weapon"
	desc = "Enchant a weapon of your choice in your hand or on the ground.\n\
	The enchantment will lasts for 15 minutes, and will automatically refresh in the hand of an Arcyne user.\n\
	Applying an enchantment to an already enchanted weapon will override the existing enchantment.\n\
	Searing Blade: Applies 8 burn damage through armor and parry / dodge, per strike.\n\
	Force Blade: Increases the force of the weapon by 5.\n\ "
	overlay_state = "create_weapon"
	sound = list('sound/magic/whiteflame.ogg')

	releasedrain = 30
	chargedrain = 2
	chargetime = 3 SECONDS // Can be used mid combat if needed.
	no_early_release = TRUE
	recharge_time = 1 MINUTES 

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	antimagic_allowed = FALSE

	charging_slowdown = 3
	cost = 1
	spell_tier = 2 // Spellblade tier.

	invocation = "Gladius Incantatus"
	invocation_type = "whisper"
	glow_color = GLOW_COLOR_METAL
	glow_intensity = GLOW_INTENSITY_LOW

/obj/effect/proc_holder/spell/invoked/enchant_weapon/cast(list/targets, mob/user = usr)
	var/target = targets[1]

	var/list/enchant_types = list(
		"Searing Blade" = SEARING_BLADE_ENCHANT,
		"Force Blade" = FORCE_BLADE_ENCHANT
	)

	if(istype(target, /obj/item))
		var/obj/item/I = target
		var/enchant_type = input(user, "Select the type of enchantment you want to apply:", "Enchant Weapon") as anything in enchant_types
		if(!enchant_type)
			return
		enchant_type = enchant_types[enchant_type]
		I.AddComponent(/datum/component/enchanted_weapon, ENCHANT_DURATION, TRUE, /datum/skill/magic/arcane, user, enchant_type)
		user.visible_message("[user] runs their hand along [I], enchanting it.")
		return TRUE
	else
		to_chat(user, span_warning("This is not a valid target for enchantment!"))
		revert_cast()
		return FALSE
		
#undef ENCHANT_DURATION
