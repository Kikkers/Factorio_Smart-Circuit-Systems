data:extend({
	{
		type = "technology",
		name = "smart-fluid-handling",
		icon = "__Smart-Circuit-Systems__/graphics/automated-fluid-handling.png",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "smart-pump"
			},
			{
				type = "unlock-recipe",
				recipe = "smart-tank"
			},
		},
		prerequisites = {"advanced-electronics", "fluid-handling"},
		unit =
		{
			count = 100,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 30
		},
		order = "d-a-b",
	},
	{
		type = "technology",
		name = "smart-energy-handling",
		icon = "__Smart-Circuit-Systems__/graphics/automated-energy-handling.png",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "smart-battery"
			},
			{
				type = "unlock-recipe",
				recipe = "smart-pole"
			},
		},
		prerequisites = {"advanced-electronics", "electric-energy-accumulators-1"},
		unit =
		{
			count = 100,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 30
		},
		order = "c-e-b",
	},
})