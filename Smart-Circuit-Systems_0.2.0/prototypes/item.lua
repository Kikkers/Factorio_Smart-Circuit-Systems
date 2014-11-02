data:extend({
	{
		type = "item",
		name = "smart-pole",
		icon = "__Smart-Circuit-Systems__/graphics/smart-pole-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "energy-pipe-distribution",
		order = "a[energy]-z",
		place_result = "pole-actuator",
		stack_size = 50
	},
	{
		type = "item",
		name = "smart-battery",
		icon = "__Smart-Circuit-Systems__/graphics/smart-battery-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "energy",
		order = "e[accumulator]-z[smart-battery]",
		place_result = "smart-battery",
		stack_size = 50
	},
	{
		type = "item",
		name = "smart-pump",
		icon = "__Smart-Circuit-Systems__/graphics/smart-pump-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "energy-pipe-distribution",
		order = "b[pipe]-d[smart-pump]",
		place_result = "smart-pump-pipe",
		stack_size = 50
	},
	{
		type = "item",
		name = "smart-pump-actuator",
		icon = "__Smart-Circuit-Systems__/graphics/smart-pump-actuator-icon.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "energy-pipe-distribution",
		order = "b[pipe]-z[smart-pump]",
		place_result = "smart-pump-actuator",
		stack_size = 50
	},
	{
		type = "item",
		name = "smart-tank",
		icon = "__Smart-Circuit-Systems__/graphics/smart-tank-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "storage",
		order = "b[fluid]-z[smart-tank]",
		place_result = "smart-tank",
		stack_size = 50
	},
	{
		type = "item",
		name = "actuator-functional-unit",
		icon = "__Smart-Circuit-Systems__/graphics/empty.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "energy-pipe-distribution",
		order = "b[pipe]-d[smart-pump]",
		stack_size = 1000
	},
	{
		type = "item",
		name = "fluid-content",
		icon = "__Smart-Circuit-Systems__/graphics/fluid-content-icon.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "barrel",
		order = "d",
		stack_size = 1000
	},
	{
		type = "item",
		name = "fluid-temperature",
		icon = "__Smart-Circuit-Systems__/graphics/fluid-temperature-icon.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "barrel",
		order = "e",
		stack_size = 1000
	},
	{
		type = "item",
		name = "charge-unit",
		icon = "__Smart-Circuit-Systems__/graphics/charge-unit-icon.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "barrel",
		order = "f",
		stack_size = 1000
	},
})
