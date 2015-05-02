
data:extend({
	{
		type = "accumulator",
		name = "capacitor-battery",
		icon = "__Smart-Circuit-Systems__/graphics/capacitor-battery-icon.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation", "placeable-off-grid"},
		minable = { hardness = 0.2, mining_time = 0.5, result = "capacitor-battery" },
		max_health = 1,
		selection_box = {{-0.0, -0.0}, {0.0, 0.0}},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "2.5kJ",
			usage_priority = "terciary",
			input_flow_limit = "2500MW",
			output_flow_limit = "2500MW"
		},
		picture =
		{
			filename = "__Smart-Circuit-Systems__/graphics/empty.png",
			width = 0,
			height = 0,
		},
		charge_animation =
		{
			filename = "__Smart-Circuit-Systems__/graphics/empty.png",
			width = 0,
			height = 0,
			line_length = 1,
			frame_count = 1,
			animation_speed = 1
		},
		charge_cooldown = 0,
		charge_light = {intensity = 0.0, size = 0},
		discharge_animation =
		{
			filename = "__Smart-Circuit-Systems__/graphics/empty.png",
			width = 0,
			height = 0,
			line_length = 1,
			frame_count = 1,
			animation_speed = 1
		},
		discharge_cooldown = 0,
		discharge_light = {intensity = 0.0, size = 0},
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/accumulator-idle.ogg",
				volume = 0.3
			},
			idle_sound = {
				filename = "__base__/sound/accumulator-idle.ogg",
				volume = 0.3
			},
			max_sounds_per_type = 5
		},
	},
	{
		type = "smart-container",
		name = "capacitor-pole",
		icon = "__Smart-Circuit-Systems__/graphics/capacitor-pole-icon.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = { hardness = 0.2, mining_time = 0.5, result = "capacitor-pole" },
		corpse = "small-remnants",
		max_health = 30,
		resistances = 
		{
			{
				type = "fire",
				percent = 70
			}
		},
		collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
		selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
		drawing_box = {{-0.6, -2.6}, {0.6, 0.4}},
		inventory_size = 1,
		picture =
		{
			filename = "__Smart-Circuit-Systems__/graphics/capacitor-pole.png",
			priority = "extra-high",
			width = 145,
			height = 95,
			shift = {1.53, -1.23}
		},
		connection_point =
		{
			shadow =
			{
				red = {2.9, -0.05},
				green = {3.4, -0.05}
			},
			wire =
			{
				red = {-0.3, -2.72},
				green = {0.3, -2.72}
			}
		}
	},
})
