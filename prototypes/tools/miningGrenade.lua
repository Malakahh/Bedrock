-- Projectiles
--------------
local function GenerateProjectile(name, radius)
	return {
		type = "projectile",
		name = name,
		flags = {"not-on-map"},
		acceleration = 0.005,
		action = {
			{
				type = "direct",
				action_delivery = {
					type = "instant",
					target_effects = {
						{
							type = "create-entity",
							entity_name = "medium-explosion"
						},
						{
							type = "create-entity",
							entity_name = "small-scorchmark",
							check_buildability = true
						}
					}
				}
			},
			{
				type = "area",
				radius = radius,
				action_delivery = {
					type = "instant",
					target_effects =
					{
						{
							type = "damage",
							damage = {amount = 0, type = "explosion"}
						},
						{
							type = "create-entity",
							entity_name = "explosion"
						}
					}
				}
			}
		},
		light = {intensity = 0.5, size = 4},
	    animation = {
			filename = "__base__/graphics/icons/explosives.png",
			frame_count = 1,
			width = 24,
			height = 24,
			priority = "high"
	    },
	    shadow = {
			filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
			frame_count = 1,
			width = 24,
			height = 24,
			priority = "high"
	    }
	}
end

data:extend({
	GenerateProjectile("miningGrenadeMk1Projectile", 10),
})

-- Capsules
-----------
data:extend({
	{
		type = "capsule",
		name = "miningGrenadeMk1",
		icon = "__base__/graphics/icons/explosives.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		capsule_action = {
			type = "throw",
			attack_parameters = {
				type = "projectile",
				ammo_category = "grenade",
				cooldown = 15,
				projectile_creation_distance = 0.6,
				range = 15,
				ammo_type = {
					category = "grenade",
					target_type = "position",
					action = {
						type = "direct",
						action_delivery = {
			              type = "projectile",
			              projectile = "miningGrenadeMk1Projectile",
			              starting_speed = 0.3
			            }
					}
				}
			}
		},
	    subgroup = "capsule",
	    order = "a[grenade]-a[normal]",
	    stack_size = 100
	}	
})


-- Recipe
---------
data:extend({
	{
		type = "recipe",
		name = "miningGrenadeMk1",
		enabled = true,
		category = "crafting",
		energy_required = 2,
		ingredients = {
			{"stone",1},
		},
		result = "miningGrenadeMk1"
	}
})