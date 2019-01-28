data:extend({
	{
		type = "ammo-turret",
		name = "miningCharge",
		icon = "__base__/graphics/icons/explosives.png",
		icon_size = 32,
		flags = {"placeable-player", "player-creation"},
		minable = { mining_time = 0.5, result = "miningCharge" },
		max_health = 50,
		collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
    	selection_box = {{-1, -1 }, {1, 1}},
		dying_explosion = "big-explosion",
		inventory_size = 1,
		automated_ammo_count = 0,
		alert_when_attacking = false,
		attack_parameters = {
			type = "projectile",
			ammo_category = "miningFuse",
			cooldown = 500,
			range = 6.5,
			damage_modifier = 0
		},
		folded_animation = {
			layers = {
				{
					filename = "__base__/graphics/icons/explosives.png",
					priority = "medium",
					width = 32,
					height = 32,
					direction_count = 1,
					frame_count = 1,
					line_length = 0,
					run_mode = "forward",
					shift = {0, 0},
					axially_symmetrical = false
				}
			}
		},
		call_for_help_radius = 0,
		starting_attack_speed = 0,
		attacking_speed = 0,
	}
})

-- Item
-------

data:extend({
	{
		type = "item",
		name = "miningCharge",
		icon = "__base__/graphics/icons/explosives.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "capsule",
		order = "a[grenade]-a[normal]",
		place_result = "miningCharge",
		stack_size = 1
	}
})

-- Recipe
---------
data:extend({
	{
		type = "recipe",
		name = "miningCharge",
		enabled = true,
		category = "crafting",
		energy_required = 2,
		ingredients = {
			{"stone",1}
		},
		result = "miningCharge"
	}
})