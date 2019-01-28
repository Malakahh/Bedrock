local function generate(name, mineResult, mineCount, pictures, mapColor)
	return {
		name = name,
		type = "simple-entity",
		flags = { "placeable-neutral", "placeable-off-grid" },
		icon = "__base__/graphics/icons/rock-big-icon.png",
		icon_size = 32,
		subgroup = "grass",
		order = "b[decorative]-l[rock]-b[big]",
		collision_box = {{-1.0, -0.9}, {1.0, 1.0}},
    	selection_box = {{-1.2, -1.2}, {1.2, 1.2}},
		minable = {
			mining_particle = "stone-particle",
			mining_time = 5,
			result = mineResult,
			count = mineCount
		},
		map_color = mapColor,
		count_as_rock_for_filtered_deconstruction = true,
		mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
		vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
		render_layer = "object",
		max_health = 500,
		resistances = {
			{
				type = "fire",
				percent = 100
			}
		},
		pictures = pictures
	}
end

local mapColorBedrock = {r=0.24, g=0.18, b=0.12}
local picturesBedrock = {
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-01.png",
		width = 94,
		height = 64,
		shift = {-0.046875, 0.171875},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-01.png",
			width = 188,
			height = 127,
			scale = 0.5,
			shift = {-0.046875, 0.171875}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-02.png",
		width = 98,
		height = 68,
		shift = {0.4375, 0.125},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-02.png",
			width = 195,
			height = 135,
			scale = 0.5,
			shift = {0.445312, 0.125}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-03.png",
		width = 103,
		height = 66,
		shift = {0.484375, 0.0625},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-03.png",
			width = 205,
			height = 132,
			scale = 0.5,
			shift = {0.484375, 0.0546875}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-04.png",
		width = 72,
		height = 71,
		shift = {0.21875, 0.046875},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-04.png",
			width = 144,
			height = 142,
			scale = 0.5,
			shift = {0.210938, 0.0390625}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-05.png",
		width = 65,
		height = 54,
		shift = {0.015625, 0.21875},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-05.png",
			width = 130,
			height = 107,
			scale = 0.5,
			shift = {0.0234375, 0.226562}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-06.png",
		width = 83,
		height = 55,
		shift = {0.15625, 0.234375},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-06.png",
			width = 165,
			height = 109,
			scale = 0.5,
			shift = {0.15625, 0.226562}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-07.png",
		width = 75,
		height = 67,
		shift = {0.265625, 0.15625},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-07.png",
			width = 150,
			height = 133,
			scale = 0.5,
			shift = {0.257812, 0.148438}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-08.png",
		width = 78,
		height = 56,
		shift = {0.09375, 0.171875},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-08.png",
			width = 156,
			height = 111,
			scale = 0.5,
			shift = {0.0859375, 0.179688}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-09.png",
		width = 94,
		height = 60,
		shift = {0.078125, 0.09375},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-09.png",
			width = 187,
			height = 120,
			scale = 0.5,
			shift = {0.078125, 0.0859375}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-10.png",
		width = 113,
		height = 64,
		shift = {-0.15625, 0.078125},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-10.png",
			width = 225,
			height = 128,
			scale = 0.5,
			shift = {-0.15625, 0.0703125}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-11.png",
		width = 92,
		height = 72,
		shift = {0.203125, 0.265625},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-11.png",
			width = 183,
			height = 144,
			scale = 0.5,
			shift = {0.195312, 0.257812}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-12.png",
		width = 79,
		height = 69,
		shift = {0.046875, 0.15625},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-12.png",
			width = 158,
			height = 138,
			scale = 0.5,
			shift = {0.0390625, 0.15625}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-13.png",
		width = 94,
		height = 75,
		shift = {0.21875, 0.21875},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-13.png",
			width = 188,
			height = 150,
			scale = 0.5,
			shift = {0.226562, 0.21875}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-14.png",
		width = 93,
		height = 80,
		shift = {0.125, 0.0625},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-14.png",
			width = 186,
			height = 160,
			scale = 0.5,
			shift = {0.132812, 0.0625}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-15.png",
		width = 91,
		height = 87,
		shift = {0.3125, -0.09375},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-15.png",
			width = 181,
			height = 174,
			scale = 0.5,
			shift = {0.304688, -0.09375}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-16.png",
		width = 106,
		height = 75,
		shift = {0.34375, 0.125},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-16.png",
			width = 212,
			height = 150,
			scale = 0.5,
			shift = {0.335938, 0.117188}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-17.png",
		width = 78,
		height = 59,
		shift = {0.25, 0.03125},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-17.png",
			width = 155,
			height = 117,
			scale = 0.5,
			shift = {0.25, 0.0390625}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-18.png",
		width = 71,
		height = 64,
		shift = {0.3125, 0.046875},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-18.png",
			width = 141,
			height = 128,
			scale = 0.5,
			shift = {0.304688, 0.0390625}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-19.png",
		width = 88,
		height = 57,
		shift = {0.390625, 0.03125},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-19.png",
			width = 176,
			height = 114,
			scale = 0.5,
			shift = {0.390625, 0.0234375}
		}
	},
	{
		filename = "__base__/graphics/decorative/rock-big/rock-big-20.png",
		width = 60,
		height = 63,
		shift = {0.140625, 0.03125},
		hr_version = {
			filename = "__base__/graphics/decorative/rock-big/hr-rock-big-20.png",
			width = 120,
			height = 125,
			scale = 0.5,
			shift = {0.148438, 0.03125}
		}
	}
}

local mapColorBedrockCoal = {r=0, g=0, b=0}
local picturesBedrockCoal = {
	{
		filename = "__Bedrock__/graphics/bedrock-coal.png",
		width = 144,
		height = 142,
		scale = 0.5,
		shift = {0.210938, 0.0390625},
	},
}

local mapColorBedrockCopper = {r=0.803, g=0.388, b=0.215}
local picturesBedrockCopper = {
	{
		filename = "__Bedrock__/graphics/bedrock-copper.png",
		width = 144,
		height = 142,
		scale = 0.5,
		shift = {0.210938, 0.0390625},
	},
}

local mapColorBedrockIron = {r=0.415, g=0.525, b=0.580}
local picturesBedrockIron = {
	{
		filename = "__Bedrock__/graphics/bedrock-iron.png",
		width = 144,
		height = 142,
		scale = 0.5,
		shift = {0.210938, 0.0390625},
	},
}

data:extend({
	generate("bedrock", "stone", 2, picturesBedrock, mapColorBedrock),
	generate("bedrock-coal", "coal", 5, picturesBedrockCoal, mapColorBedrockCoal),
	generate("bedrock-copper", "copper-ore", 5, picturesBedrockCopper, mapColorBedrockCopper),
	generate("bedrock-iron", "iron-ore", 5, picturesBedrockIron, mapColorBedrockIron),
})