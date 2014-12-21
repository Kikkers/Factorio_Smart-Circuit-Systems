data:extend({
	{
		type = "accumulator",
		name = "smart-battery",
		icon = "__Smart-Circuit-Systems__/graphics/smart-battery-icon.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = { hardness = 0.2, mining_time = 0.5, result = "smart-battery" },
		corpse = "medium-remnants",
		max_health = 100,
		collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
		selection_box = {{-1, -1}, {1, 1}},
		drawing_box = {{-1, -1.5}, {1, .5}},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "2.5MJ",
			usage_priority = "terciary",
			input_flow_limit = "150kW",
			output_flow_limit = "150kW"
		},
		picture =
		{
			filename = "__base__/graphics/entity/basic-accumulator/basic-accumulator.png",
			priority = "extra-high",
			width = 124,
			height = 103,
			shift = {0.7, -0.2}
		},
		charge_animation =
		{
			filename = "__base__/graphics/entity/basic-accumulator/basic-accumulator-charge-animation.png",
			width = 138,
			height = 135,
			line_length = 8,
			frame_count = 24,
			shift = {0.482, -0.638},
			animation_speed = 0.5
		},
		charge_cooldown = 30,
		charge_light = {intensity = 0.3, size = 7},
		discharge_animation =
		{
			filename = "__base__/graphics/entity/basic-accumulator/basic-accumulator-discharge-animation.png",
			width = 147,
			height = 128,
			line_length = 8,
			frame_count = 24,
			shift = {0.395, -0.525},
			animation_speed = 0.5
		},
		discharge_cooldown = 60,
		discharge_light = {intensity = 0.7, size = 7},
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/accumulator-working.ogg",
				volume = 1
			},
			idle_sound = {
				filename = "__base__/sound/accumulator-idle.ogg",
				volume = 0.4
			},
			max_sounds_per_type = 5
		},
	},
	{
		type = "smart-container",
		name = "smart-battery-chest",
		icon = "__base__/graphics/icons/basic-accumulator.png",
		flags = {"placeable-off-grid"},
		minable = { hardness = 0.2, mining_time = 0.5, result = "smart-battery" },
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		drawing_box = {{0, -2.3}, {0, -1.3}},
		max_health = 1,
		inventory_size = 1,
		picture = 
		{ 
			filename = "__Smart-Circuit-Systems__/graphics/smart-battery-pole.png", 
			width = 160, 
			height = 101, 
			shift = {1.8, -0.855},
		},
		connection_point =
		{
			shadow =
			{
				red =	 {3.4, 0.2},
				green = {4.1, 0.2}
			},
			wire =
			{
				red =	 {-0.38, -2.35},
				green = {0.32, -2.35}
			}
		}
	},
})
