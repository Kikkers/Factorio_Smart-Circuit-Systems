

data:extend({
	{
		type = "smart-container",
		name = "item-sensor",
		icon = "__Smart-Circuit-Systems__/graphics/item-sensor-icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = { hardness = 0.2, mining_time = 0.5, result = "item-sensor" },
		max_health = 60,
		corpse = "small-remnants",
		resistances = { { type = "fire", percent = 70 } },
		collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fast_replaceable_group = "container",
		inventory_size = 32767,
		picture =
		{
			filename = "__Smart-Circuit-Systems__/graphics/item-sensor.png",
			priority = "extra-high",
			width = 57,
			height = 41,
			shift = {0.47, -0.28}
		},
		connection_point =
		{
			shadow =
			{
				red = {1.1, 0},
				green = {1.1, 0}
			},
			wire =
			{
				red = {0.0, -0.85},
				green = {0.0, -0.85}
			}
		}
	},
})
