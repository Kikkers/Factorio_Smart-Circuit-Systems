data:extend({
{  
	type = "inserter",
	name = "omni-actuator",
	icon = "__Smart-Circuit-Systems__/graphics/omni-actuator-icon.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "omni-actuator"},
	max_health = 50,
    corpse = "small-remnants",
    resistances = { { type = "fire", percent = 90 } },
	collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    pickup_position = {0, -0.4},
    insert_position = {0, 1.0},
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
	hand_base_picture = { filename = "__Smart-Circuit-Systems__/graphics/empty.png", width = 0, height = 0 },
	hand_closed_picture = { filename = "__Smart-Circuit-Systems__/graphics/empty.png", width = 0, height = 0 },
	hand_open_picture = { filename = "__Smart-Circuit-Systems__/graphics/empty.png", width = 0, height = 0 },
	hand_base_shadow = { filename = "__Smart-Circuit-Systems__/graphics/empty.png", width = 0, height = 0 },
	hand_closed_shadow = { filename = "__Smart-Circuit-Systems__/graphics/empty.png", width = 0, height = 0 },
	hand_open_shadow = { filename = "__Smart-Circuit-Systems__/graphics/empty.png", width = 0, height = 0 },
	platform_picture =
	{
		sheet=
		{
			filename = "__Smart-Circuit-Systems__/graphics/omni-actuator.png",
			priority = "extra-high",
			width = 50,
			height = 42,
			shift = {0.19, 0},
		}
	},
},
{
	type = "simple-entity",
	name = "actuator-redlamp",
	flags = {"placeable-off-grid"},
	drawing_box = {{-0.2, -0.2}, {0.2, 0.2}},
	render_layer = "object",
	max_health = 1,
	pictures =
	{
		{
			filename = "__Smart-Circuit-Systems__/graphics/redlamp.png",
			priority = "extra-high-no-scale",
			width = 11,
			height = 11,
			shift = {0, -0.28},
		},
	}
},
{
	type = "simple-entity",
	name = "actuator-greenlamp",
	flags = {"placeable-off-grid"},
	drawing_box = {{-0.2, -0.2}, {0.2, 0.2}},
	render_layer = "object",
	max_health = 1,
	pictures =
	{
		{
			filename = "__Smart-Circuit-Systems__/graphics/greenlamp.png",
			priority = "extra-high-no-scale",
			width = 11,
			height = 11,
			shift = {0, -0.28},
		},
	}
},
})