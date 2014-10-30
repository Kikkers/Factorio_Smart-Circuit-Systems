data:extend({
	{
		type = "item",
		name = "smart-pump",
		icon = "__Smart-Fluid__/graphics/smart-pump-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "energy-pipe-distribution",
		order = "b[pipe]-d[smart-pump]",
		place_result = "smart-pump-pipe",
		stack_size = 50
	},
	{
		type = "item",
		name = "smart-pump-actuator",
		icon = "__Smart-Fluid__/graphics/smart-pump-actuator-icon.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "energy-pipe-distribution",
		order = "b[pipe]-d[smart-pump]",
		place_result = "smart-pump-actuator",
		stack_size = 50
	},
	{
		type = "item",
		name = "smart-pump-sensor-unit",
		icon = "__Smart-Fluid__/graphics/empty.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "energy-pipe-distribution",
		order = "b[pipe]-d[smart-pump]",
		stack_size = 1000
	},
	{
		type = "item",
		name = "smart-tank",
		icon = "__Smart-Fluid__/graphics/smart-tank-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "storage",
		order = "b[fluid]-f[smart-tank]",
		place_result = "smart-tank",
		stack_size = 50
	},
	{
		type = "item",
		name = "fluid-content",
		icon = "__Smart-Fluid__/graphics/fluid-content-icon.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "barrel",
		order = "d",
		stack_size = 1000
	},
	{
		type = "item",
		name = "fluid-temperature",
		icon = "__Smart-Fluid__/graphics/fluid-temperature-icon.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "barrel",
		order = "e",
		stack_size = 1000
	},
})
