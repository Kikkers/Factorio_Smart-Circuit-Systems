data:extend({
{
	type = "pipe",
    name = "smart-tank-pipe",
    max_health = 60,
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
	corpse = "small-remnants",
	resistances = 
	{
		{
			type = "fire",
			percent = 90
		}
	},
    fluid_box =
    {
      base_area = 1,
      pipe_connections =
      {
        { position = {0, -1} },
        { position = {1, 0} },
        { position = {0, 1} },
        { position = {-1, 0} }
      },
    },
    pictures = pipepictures(),
    horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.15625}},
    vertical_window_bounding_box = {{-0.28125, -0.40625}, {0.03125, 0.125}}
}, 
{
    type = "smart-container",
    name = "smart-tank",
	icon = "__Smart-Fluid__/graphics/smart-tank-icon.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
	fast_replaceable_group = "pipe",
	minable = { hardness = 0.2, mining_time = 0.5, result = "smart-tank" },
	max_health = 1,
	resistances = 
	{
		{
			type = "fire",
			percent = 90
		}
	},
	--collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
	selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
	inventory_size = 2,
	picture =
	{
		filename = "__Smart-Fluid__/graphics/smart-tank.png",
		priority = "extra-high",
		width = 31,
		height = 31,
		shift = {0.19, -0.3}
	},
	connection_point =
	{
		shadow =
		{
			red = {0.57, -0.25},
			green = {0.57, -0.25}
		},
		wire =
		{
			red = {0.17, -0.75},
			green = {0.17, -0.75}
		}
	}
},
})
