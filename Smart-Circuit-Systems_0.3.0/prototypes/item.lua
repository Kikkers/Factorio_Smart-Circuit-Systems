data:extend({
	{
		type = "item-subgroup",
		name = "smart-stuff",
		group = "logistics",
		order = "e",
	},
	{
		type = "item",
		name = "smart-pole",
		icon = "__Smart-Circuit-Systems__/graphics/smart-pole-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "smart-stuff",
		order = "a",
		place_result = "pole-actuator",
		stack_size = 50
	},
	{
		type = "item",
		name = "smart-battery",
		icon = "__Smart-Circuit-Systems__/graphics/smart-battery-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "smart-stuff",
		order = "b",
		place_result = "smart-battery",
		stack_size = 50
	},
	{
		type = "item",
		name = "omni-actuator",
		icon = "__Smart-Circuit-Systems__/graphics/omni-actuator-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "smart-stuff",
		order = "c",
		place_result = "omni-actuator",
		stack_size = 50
	},
	{
		type = "item",
		name = "smart-tank",
		icon = "__Smart-Circuit-Systems__/graphics/smart-tank-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "smart-stuff",
		order = "d",
		place_result = "smart-tank",
		stack_size = 50
	},
	{
		type = "item",
		name = "fluid-content",
		icon = "__Smart-Circuit-Systems__/graphics/fluid-content-icon.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "smart-stuff",
		order = "e",
		stack_size = 1000
	},
	{
		type = "item",
		name = "fluid-temperature",
		icon = "__Smart-Circuit-Systems__/graphics/fluid-temperature-icon.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "smart-stuff",
		order = "f",
		stack_size = 1000
	},
	{
		type = "item",
		name = "charge-unit",
		icon = "__Smart-Circuit-Systems__/graphics/charge-unit-icon.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "smart-stuff",
		order = "g",
		stack_size = 1000
	},
})
