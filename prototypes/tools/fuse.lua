data:extend({
	{
		type = "ammo-category",
		name = "miningFuse"
	}
})

-- Ammo
-------

data:extend({
	{
		type = "ammo",
		name = "miningFuse",
		icon = "__base__/graphics/icons/iron-stick.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		ammo_type =
	    {
	    	category = "miningFuse"
		},
		magazine_size = 1,
		subgroup = "capsule",
		order = "a[grenade]-a[normal]",
		--place_result = "miningFuse",
		stack_size = 5
	}
})

-- Recipe
---------
data:extend({
	{
		type = "recipe",
		name = "miningFuse",
		enabled = true,
		category = "crafting",
		energy_required = 2,
		ingredients = {
			{"stone",1}
		},
		result = "miningFuse"
	}
})