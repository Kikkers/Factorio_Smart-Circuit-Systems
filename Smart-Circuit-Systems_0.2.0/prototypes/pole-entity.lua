wire_pictures = {
	copper =
	{
		filename = "__base__/graphics/entity/small-electric-pole/copper-wire.png",
		priority = "extra-high-no-scale",
		width = 224,
		height = 46
	},
	green =
	{
		filename = "__base__/graphics/entity/small-electric-pole/green-wire.png",
		priority = "extra-high-no-scale",
		width = 224,
		height = 46
	},
	radius =
	{
		filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
		width = 12,
		height = 12
	},
	red =
	{
		filename = "__base__/graphics/entity/small-electric-pole/red-wire.png",
		priority = "extra-high-no-scale",
		width = 224,
		height = 46
	},
	shadow =
	{
		filename = "__base__/graphics/entity/small-electric-pole/wire-shadow.png",
		priority = "extra-high-no-scale",
		width = 224,
		height = 46
	}
}

data:extend({

	{
		type = "simple-entity",
		name = "smart-pole-deco-vertical",
		drawing_box = {{-1.2, -1.2}, {1.2, 1.2}},
		render_layer = "object",
		max_health = 1,
		pictures =
		{
			{
				filename = "__Smart-Circuit-Systems__/graphics/smart-pole.png",
				width = 135,
				height = 155,
				shift = {0.65, 0.2},
			},
		}
	},
	{
		type = "simple-entity",
		name = "smart-pole-deco-horizontal",
		drawing_box = {{-1.2, -1.2}, {1.2, 1.2}},
		render_layer = "object",
		max_health = 1,
		pictures =
		{
			{
				filename = "__Smart-Circuit-Systems__/graphics/smart-pole-h.png",
				width = 135,
				height = 155,
				shift = {0.65, 0.2},
			},
		}
	},




	{	
		type = "inserter",
		name = "pole-actuator",
		icon = "__Smart-Circuit-Systems__/graphics/smart-pole-icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "smart-pole"},
		max_health = 100,
		render_layer = "object",
		corpse = "medium-remnants",
		resistances = 
		{
			{
				type = "fire",
				percent = 90
			}
		},
		collision_box = {{-0.34, -1.10}, {0.34, 1.10}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		drawing_box = {{-1.2, -1.2}, {1.2, 1.2}},
		pickup_position = {-0.2, -0.2},
		insert_position = {0.2, 0.2},
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
				filename = "__Smart-Circuit-Systems__/graphics/smart-pole.png",
				priority = "extra-high",
				width = 135,
				height = 155,
				frames = 2,
				shift = {0.65, 0.2},
			}
		},
	},
	
	{
		type = "electric-pole",
		name = "west-node",
		icon = "__base__/graphics/icons/small-electric-pole.png",
		minable = {hardness = 0.2, mining_time = 0.5, result = "smart-pole"},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		max_health = 1,
		maximum_wire_distance = 5,
		supply_area_distance = 1.5,
		pictures =
		{
			filename = "__Smart-Circuit-Systems__/graphics/smart-pole.png",
			priority = "high",
			width = 0,--123,
			height = 0,--124,
			axially_symetric = false,
			direction_count = 1,
			shift = {1.4, -1.1}
		},
		connection_points =
		{
			{
				shadow =
				{
					copper = {1.8, 0.0},
					red =		{1.8, -0.25 },
					green =	{1.8, 0.25 }
				},
				wire =
				{
					copper = {0.3, -1.5},
					red =		{0.3, -1.75 },
					green =	{0.3, -1.25 }
				}
			},
		},
		copper_wire_picture = wire_pictures.copper,
		green_wire_picture = wire_pictures.green,
		radius_visualisation_picture = wire_pictures.radius,
		red_wire_picture = wire_pictures.red,
		wire_shadow_picture = wire_pictures.shadow,
	},

	{
		type = "electric-pole",
		name = "east-node",
		icon = "__base__/graphics/icons/small-electric-pole.png",
		minable = {hardness = 0.2, mining_time = 0.5, result = "smart-pole"},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		max_health = 1,
		maximum_wire_distance = 5,
		supply_area_distance = 1.5,
		pictures =
		{
			filename = "__Smart-Circuit-Systems__/graphics/smart-pole.png",
			priority = "high",
			width = 0,--123,
			height = 0,--124,
			axially_symetric = false,
			direction_count = 1,
			shift = {1.4, -1.1}
		},
		connection_points =
		{
			{
				shadow =
				{
					copper = {1.2, 0.0},
					red =		{1.2, -0.25 },
					green =	{1.2, 0.25 }
				},
				wire =
				{
					copper = {-0.3, -1.5},
					red =		{-0.3, -1.75 },
					green =	{-0.3, -1.25 }
				}
			},
		},
		copper_wire_picture = wire_pictures.copper,
		green_wire_picture = wire_pictures.green,
		radius_visualisation_picture = wire_pictures.radius,
		red_wire_picture = wire_pictures.red,
		wire_shadow_picture = wire_pictures.shadow,
	},

	{
		type = "electric-pole",
		name = "north-node",
		icon = "__base__/graphics/icons/small-electric-pole.png",
		minable = {hardness = 0.2, mining_time = 0.5, result = "smart-pole"},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		max_health = 1,
		maximum_wire_distance = 5,
		supply_area_distance = 1.5,
		pictures =
		{
			filename = "__Smart-Circuit-Systems__/graphics/smart-pole.png",
			priority = "high",
			width = 0,--123,
			height = 0,--124,
			axially_symetric = false,
			direction_count = 1,
			shift = {1.4, -1.1}
		},
		connection_points =
		{
			{
				shadow =
				{
					copper = {1.45 , 0.12},
					red =		{1.15,	0.12},
					green =	{1.75 , 0.12}
				},
				wire =
				{
					copper = {0.05 , -1.2},
					red =		{-0.25, -1.2},
					green =	{0.35 , -1.2}
				}
			},
		},
		copper_wire_picture = wire_pictures.copper,
		green_wire_picture = wire_pictures.green,
		radius_visualisation_picture = wire_pictures.radius,
		red_wire_picture = wire_pictures.red,
		wire_shadow_picture = wire_pictures.shadow,
	},

	{
		type = "electric-pole",
		name = "south-node",
		icon = "__Smart-Circuit-Systems__/graphics/smart-pole-icon.png",
		minable = {hardness = 0.2, mining_time = 0.5, result = "smart-pole"},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		max_health = 1,
		maximum_wire_distance = 5,
		supply_area_distance = 1.5,
		pictures =
		{
			filename = "__Smart-Circuit-Systems__/graphics/smart-pole.png",
			priority = "high",
			width = 0,--123,
			height = 0,--124,
			axially_symetric = false,
			direction_count = 1,
			shift = {1.4, -1.1}
		},
		connection_points =
		{
			{
				shadow =
				{
					copper = {1.45 , -0.12},
					red =		{1.15,	-0.12},
					green =	{1.75 , -0.12}
				},
				wire =
				{
					copper = {0.05 , -1.45},
					red =		{-0.25, -1.45},
					green =	{0.35 , -1.45}
				}
			},
		},
		copper_wire_picture = wire_pictures.copper,
		green_wire_picture = wire_pictures.green,
		radius_visualisation_picture = wire_pictures.radius,
		red_wire_picture = wire_pictures.red,
		wire_shadow_picture = wire_pictures.shadow,
	},

	{
		type = "decorative",
		name = "actuator-active-indicator",
		selectable_in_game = false,
		--render_layer = "decorative",
		pictures =
		{
			{
				filename = "__base__/graphics/entity/decorative/brown-asterisk/brown-asterisk-01.png",
				width = 0,--30,
				height = 0,--26,
			},
		}
	},
})
