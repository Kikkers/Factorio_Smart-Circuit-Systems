data:extend({
	{
		type = "technology",
		name = "advanced-circuitry",
		icon = "__Smart-Circuit-Systems__/graphics/advanced-circuitry.png",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "smart-tank"
			},
			{
				type = "unlock-recipe",
				recipe = "omni-actuator"
			},
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
			count = 200,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 30
		},
		order = "d-a-b",
	},
})