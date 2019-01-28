data:extend({
	{
		type = "car",
		name = "moleMachineMk1",
		icon = "__base__/graphics/icons/tank.png",
		icon_size = 32,
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
		minable = {mining_time = 1, result = "moleMachineMk1"},
	    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
	    max_health = 2000,
	    corpse = "medium-remnants",
	    dying_explosion = "medium-explosion",
	    alert_icon_shift = util.by_pixel(-4, -13),
	    immune_to_tree_impacts = true,
	    energy_per_hit_point = 0.5,
	    resistances =
	    {
			{
				type = "fire",
				decrease = 15,
				percent = 60
			},
			{
				type = "physical",
				decrease = 15,
				percent = 60
			},
			{
				type = "impact",
				--decrease = 50,
				percent = 97
			},
			{
				type = "explosion",
				decrease = 15,
				percent = 70
			},
			{
				type = "acid",
				decrease = 15,
				percent = 50
			}
	    },
	    collision_box = {{-0.9, -1.3}, {0.9, 1.3}},
	    selection_box = {{-0.9, -1.3}, {0.9, 1.3}},
	    drawing_box = {{-1.8, -1.8}, {1.8, 1.5}},
	    effectivity = 0.2,
	    braking_power = "400kW",
	    burner =
	    {
			fuel_category = "chemical",
			effectivity = 0.75,
			fuel_inventory_size = 2,
			smoke =
			{
				{
					name = "tank-smoke",
					deviation = {0.25, 0.25},
					frequency = 50,
					position = {0, 1.5},
					starting_frame = 0,
					starting_frame_deviation = 60
				}
			}
	    },
	    consumption = "600kW",
	    terrain_friction_modifier = 0.2,
	    friction = 0.02,
	    light =
	    {
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "extra-high",
					flags = { "light" },
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {-2.6, -14},
				size = 2,
				rotation_shift = 0.97,
				intensity = 0.6,
				color = {r = 0.9, g = 1.0, b = 1.0}
			},
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture = 
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "extra-high",
					flags = { "light" },
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {2.6, -14},
				rotation_shift = 0.03,
				size = 2,
				intensity = 0.6,
				color = {r = 0.9, g = 1.0, b = 1.0}
			},
			{
				type = "basic",
				minimum_darkness = 0.0,
				picture = 
				{
					filename = "__core__/graphics/light-medium.png",
					priority = "extra-high",
					flags = { "light" },
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {0.0, 0.9},
				size = 7,
				intensity = 0.35,
				color = {r = 0.9, g = 0.3, b = 0.3}
			},
	    },
	    animation =
	    {
	      layers =
	      {
	        {
	          priority = "low",
	          width = 135,
	          height = 106,
	          frame_count = 2,
	          direction_count = 64,
	          shift = util.by_pixel(-4.5, -10),
	          animation_speed = 8,
	          max_advance = 1,
	          stripes =
	          {
	            {
	             filename = "__base__/graphics/entity/tank/tank-base-1.png",
	             width_in_frames = 2,
	             height_in_frames = 16
	            },
	            {
	             filename = "__base__/graphics/entity/tank/tank-base-2.png",
	             width_in_frames = 2,
	             height_in_frames = 16
	            },
	            {
	             filename = "__base__/graphics/entity/tank/tank-base-3.png",
	             width_in_frames = 2,
	             height_in_frames = 16
	            },
	            {
	             filename = "__base__/graphics/entity/tank/tank-base-4.png",
	             width_in_frames = 2,
	             height_in_frames = 16
	            }
	          },
	          hr_version =
	          {
	            priority = "low",
	            width = 269,
	            height = 212,
	            frame_count = 2,
	            direction_count = 64,
	            shift = util.by_pixel(-4.75, -10),
	            animation_speed = 8,
	            max_advance = 1,
	            stripes =
	            {
	              {
	               filename = "__base__/graphics/entity/tank/hr-tank-base-1.png",
	               width_in_frames = 2,
	               height_in_frames = 16
	              },
	              {
	               filename = "__base__/graphics/entity/tank/hr-tank-base-2.png",
	               width_in_frames = 2,
	               height_in_frames = 16
	              },
	              {
	               filename = "__base__/graphics/entity/tank/hr-tank-base-3.png",
	               width_in_frames = 2,
	               height_in_frames = 16
	              },
	              {
	               filename = "__base__/graphics/entity/tank/hr-tank-base-4.png",
	               width_in_frames = 2,
	               height_in_frames = 16
	              }
	            },
	            scale = 0.5
	          }
	        },
	        {
	          priority = "low",
	          width = 104,
	          height = 84,
	          frame_count = 2,
	          apply_runtime_tint = true,
	          direction_count = 64,
	          shift = util.by_pixel(-5, -21),
	          max_advance = 1,
	          line_length = 2,
	          stripes = util.multiplystripes(2,
	          {
	            {
	              filename = "__base__/graphics/entity/tank/tank-base-mask-1.png",
	              width_in_frames = 1,
	              height_in_frames = 22
	            },
	            {
	              filename = "__base__/graphics/entity/tank/tank-base-mask-2.png",
	              width_in_frames = 1,
	              height_in_frames = 22
	            },
	            {
	              filename = "__base__/graphics/entity/tank/tank-base-mask-3.png",
	              width_in_frames = 1,
	              height_in_frames = 20
	            }
	          }),
	          hr_version =
	          {
	            priority = "low",
	            width = 207,
	            height = 166,
	            frame_count = 2,
	            apply_runtime_tint = true,
	            direction_count = 64,
	            shift = util.by_pixel(-4.75, -21),
	            max_advance = 1,
	            line_length = 2,
	            stripes = util.multiplystripes(2,
	            {
	              {
	                filename = "__base__/graphics/entity/tank/hr-tank-base-mask-1.png",
	                width_in_frames = 1,
	                height_in_frames = 22
	              },
	              {
	                filename = "__base__/graphics/entity/tank/hr-tank-base-mask-2.png",
	                width_in_frames = 1,
	                height_in_frames = 22
	              },
	              {
	                filename = "__base__/graphics/entity/tank/hr-tank-base-mask-3.png",
	                width_in_frames = 1,
	                height_in_frames = 20
	              }
	            }),
	            scale = 0.5
	          }
	        },
	        {
	          priority = "low",
	          width = 151,
	          height = 98,
	          frame_count = 2,
	          draw_as_shadow = true,
	          direction_count = 64,
	          shift = util.by_pixel(17.5, 7),
	          max_advance = 1,
	          stripes = util.multiplystripes(2,
	          {
	           {
	            filename = "__base__/graphics/entity/tank/tank-base-shadow-1.png",
	            width_in_frames = 1,
	            height_in_frames = 16
	           },
	           {
	            filename = "__base__/graphics/entity/tank/tank-base-shadow-2.png",
	            width_in_frames = 1,
	            height_in_frames = 16
	           },
	           {
	            filename = "__base__/graphics/entity/tank/tank-base-shadow-3.png",
	            width_in_frames = 1,
	            height_in_frames = 16
	           },
	           {
	            filename = "__base__/graphics/entity/tank/tank-base-shadow-4.png",
	            width_in_frames = 1,
	            height_in_frames = 16
	           }
	          }),
	          hr_version =
	          {
	            priority = "low",
	            width = 301,
	            height = 194,
	            frame_count = 2,
	            draw_as_shadow = true,
	            direction_count = 64,
	            shift = util.by_pixel(17.75, 7),
	            max_advance = 1,
	            stripes = util.multiplystripes(2,
	            {
	             {
	              filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-1.png",
	              width_in_frames = 1,
	              height_in_frames = 16
	             },
	             {
	              filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-2.png",
	              width_in_frames = 1,
	              height_in_frames = 16
	             },
	             {
	              filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-3.png",
	              width_in_frames = 1,
	              height_in_frames = 16
	             },
	             {
	              filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-4.png",
	              width_in_frames = 1,
	              height_in_frames = 16
	             }
	            }),
	            scale = 0.5
	          }
	        }
	      }
	    },
	    stop_trigger_speed = 0.2,
	    sound_no_fuel =
	    {
	      {
	        filename = "__base__/sound/fight/tank-no-fuel-1.ogg",
	        volume = 0.6
	      }
	    },
	    stop_trigger =
	    {
	      {
	        type = "play-sound",
	        sound =
	        {
	          {
	            filename = "__base__/sound/car-breaks.ogg",
	            volume = 0.6
	          }
	        }
	      }
	    },
	    sound_minimum_speed = 0.15;
	    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
	    working_sound =
	    {
	      sound =
	      {
	        filename = "__base__/sound/fight/tank-engine.ogg",
	        volume = 0.6
	      },
	      activate_sound =
	      {
	        filename = "__base__/sound/fight/tank-engine-start.ogg",
	        volume = 0.6
	      },
	      deactivate_sound =
	      {
	        filename = "__base__/sound/fight/tank-engine-stop.ogg",
	        volume = 0.6
	      },
	      match_speed_to_activity = true
	    },
	    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
	    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
	    rotation_speed = 0.0035,
	    tank_driving = true,
	    weight = 1500,
	    inventory_size = 200
	}
})

data:extend({
	{
		type = "item",
		name = "moleMachineMk1",
		icon = "__base__/graphics/icons/tank.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "transport",
		order = "b[personal-transport]-b[car]",
		place_result = "moleMachineMk1",
		stack_size = 1
	}
})

data:extend({
	{
		type = "recipe",
		name = "moleMachineMk1",
		enabled = true,
		category = "crafting",
		energy_required = 2,
		ingredients = {
			{"iron-plate",4},
		},
		result = "moleMachineMk1"
	}
})

data:extend({
	{
		type = "custom-input",
		name = "bedrockMoleMachineIncreaseWidthHotkey",
		key_sequence = "PAD +",
		consuming = "none"
	},
	{
		type = "custom-input",
		name = "bedrockMoleMachineDecreaseWidthHotkey",
		key_sequence = "PAD -",
		consuming = "none"
	}
})