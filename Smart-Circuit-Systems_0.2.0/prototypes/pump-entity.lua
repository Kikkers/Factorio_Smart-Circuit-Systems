data:extend({
{  
	type = "inserter",
	name = "smart-pump-actuator",
	icon = "__Smart-Circuit-Systems__/graphics/smart-pump-actuator-icon.png",
	minable = {hardness = 0.2, mining_time = 0.5, result = "smart-pump"},
	max_health = 1,
	--collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
	selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
	pickup_position = {0, -0.4},
	insert_position = {0, 0.4},
	energy_per_movement = 200,
	energy_per_rotation = 200,
	energy_source =
	{
		type = "electric",
		usage_priority = "secondary-input",
		emissions = 0.01 / 2.5,
		drain = "0.1kW",
	},
	extension_speed = 0.7,
	programmable = true,
	rotation_speed = 0.35,
	hand_base_picture = { filename = "__Smart-Circuit-Systems__/graphics/smart-pump-actuator.png", width = 0, height = 0 },
	hand_closed_picture = { filename = "__Smart-Circuit-Systems__/graphics/smart-pump-actuator.png", width = 0, height = 0 },
	hand_open_picture = { filename = "__Smart-Circuit-Systems__/graphics/smart-pump-actuator.png", width = 0, height = 0 },
	hand_base_shadow = { filename = "__Smart-Circuit-Systems__/graphics/smart-pump-actuator.png", width = 0, height = 0 },
	hand_closed_shadow = { filename = "__Smart-Circuit-Systems__/graphics/smart-pump-actuator.png", width = 0, height = 0 },
	hand_open_shadow = { filename = "__Smart-Circuit-Systems__/graphics/smart-pump-actuator.png", width = 0, height = 0 },
	platform_picture =
	{
		sheet=
		{
			filename = "__Smart-Circuit-Systems__/graphics/smart-pump-actuator.png",
			priority = "extra-high",
			width = 32,
			height = 39,
			shift = {0, 0.2},
		}
	},
},



{
	type = "pump",
	name = "smart-pump-pipe",
	icon = "__Smart-Circuit-Systems__/graphics/smart-pump-icon.png",
	flags = {"placeable-neutral", "placeable-player", "player-creation"},
	minable = {hardness = 0.2, mining_time = 0.5, result = "smart-pump"},
	fast_replaceable_group = "pipe",
	max_health = 60,
	corpse = "small-remnants",
	collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
	selection_box = {{-0.25, -0.25}, {0.25, 0.25}},
	fluid_box =
	{
		base_area = 1,
		pipe_covers = pipecoverspictures(),
		pipe_connections =
		{
			{ position = {0, -1}, type="output" },
			{ position = {0, 1}, type="input" },
		},
	},
	energy_source =
	{
		type = "electric",
		usage_priority = "secondary-input",
	},
	energy_usage = "30kW",
	pumping_speed = 0.25,
	animations =
	{
		north =
		{
			filename = "__Smart-Circuit-Systems__/graphics/smart-pump-up.png",
			width = 46,
			height = 56,
			frame_count = 8,
			shift = {0.09375, 0.03125},
			animation_speed = 0.5
		},
		east =
		{
			filename = "__Smart-Circuit-Systems__/graphics/smart-pump-right.png",
			width = 51,
			height = 56,
			frame_count = 8,
			shift = {0.265625, -0.21875},
			animation_speed = 0.5
		},
		south =
		{
			filename = "__Smart-Circuit-Systems__/graphics/smart-pump-down.png",
			width = 61,
			height = 58,
			frame_count = 8,
			shift = {0.421875, -0.125},
			animation_speed = 0.5
		},
		west =
		{
			filename = "__Smart-Circuit-Systems__/graphics/smart-pump-left.png",
			width = 56,
			height = 52,
			frame_count = 8,
			shift = {0.3125, 0.0625},
			animation_speed = 0.5
		}
	}
},

})
