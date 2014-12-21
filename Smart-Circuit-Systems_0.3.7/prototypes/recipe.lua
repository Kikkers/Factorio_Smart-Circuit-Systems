data:extend({
{
	type = "recipe",
	name = "smart-battery",
	energy_required = 4,
	enabled = "false",
	ingredients =
	{
		{"basic-accumulator", 1},
		{"electronic-circuit", 3},
		{"steel-plate", 4},
	},
	result = "smart-battery"
},
{
	type = "recipe",
	name = "capacitor-pole",
	energy_required = 1,
	enabled = "false",
	ingredients =
	{
		{"battery", 1},
		{"electronic-circuit", 2},
		{"iron-plate", 2},
	},
	result = "capacitor-pole"
},
{
	type = "recipe",
	name = "smart-pole",
	energy_required = 2,
	enabled = "false",
	ingredients =
	{
		{"steel-plate", 4},
		{"copper-plate", 4},
		{"electronic-circuit", 4},
	},
	result = "smart-pole"
},
{
	type = "recipe",
	name = "omni-actuator",
	energy_required = 1,
	enabled = "false",
	ingredients =
	{
		{"iron-plate", 5},
		{"electronic-circuit", 10},
	},
	result = "omni-actuator"
},
{
	type = "recipe",
	name = "smart-tank",
	energy_required = 1,
	enabled = "false",
	ingredients =
	{
		{"pipe", 1},
		{"steel-plate", 2},
		{"electronic-circuit", 3},
	},
	result = "smart-tank"
},
{
	type = "recipe",
	name = "item-sensor",
	energy_required = 1,
	enabled = "false",
	ingredients =
	{
		{"steel-plate", 10},
		{"advanced-circuit", 5},
	},
	result = "item-sensor"
},
})
