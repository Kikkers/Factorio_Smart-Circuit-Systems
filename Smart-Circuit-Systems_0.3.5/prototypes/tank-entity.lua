
custompipepictures = function()
  return {
    straight_vertical_single =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-single.png",
      priority = "extra-high",
      width = 44,
      height = 58
    },
    straight_vertical =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
      priority = "extra-high",
      width = 44,
      height = 42
    },
    straight_vertical_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    straight_horizontal_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    straight_horizontal =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    corner_up_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-right.png",
      priority = "extra-high",
      width = 32,
      height = 40
    },
    corner_up_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-left.png",
      priority = "extra-high",
      width = 44,
      height = 44
    },
    corner_down_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-right.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    corner_down_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-left.png",
      priority = "extra-high",
      width = 36,
      height = 32
    },
    t_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-up.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    t_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-down.png",
      priority = "extra-high",
      width = 40,
      height = 44
    },
    t_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-right.png",
      priority = "extra-high",
      width = 40,
      height = 32
    },
    t_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-left.png",
      priority = "extra-high",
      width = 44,
      height = 42
    },
    cross =
    {
      filename = "__base__/graphics/entity/pipe/pipe-cross.png",
      priority = "extra-high",
      width = 40,
      height = 40
    },
    ending_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-up.png",
      priority = "extra-high",
      width = 44,
      height = 42
      },
    ending_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-down.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    ending_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-right.png",
      priority = "extra-high",
      width = 32,
      height = 44
    },
    ending_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-left.png",
      priority = "extra-high",
      width = 58,
      height = 44
    },
    horizontal_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-horizontal-window-background.png",
      priority = "extra-high",
      width = 0,
      height = 0
    },
    vertical_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-vertical-window-background.png",
      priority = "extra-high",
      width = 0,
      height = 0
    },
    fluid_background =
    {
      filename = "__base__/graphics/entity/pipe/fluid-background.png",
      priority = "extra-high",
      width = 0,
      height = 0
    },
    low_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
      priority = "extra-high",
      width = 0,
      height = 0
    },
    middle_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-medium-temperature.png",
      priority = "extra-high",
      width = 0,
      height = 0
    },
    high_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-high-temperature.png",
      priority = "extra-high",
      width = 0,
      height = 0
    }
  }
end



data:extend({
{
	type = "pipe",
    name = "smart-tank-pipe",
	selectable_in_game = false,
    max_health = 1,
    collision_box = {{-0.01, -0.01}, {0.01, 0.01}},
	--corpse = "small-remnants",
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
    pictures = custompipepictures(),
    horizontal_window_bounding_box = {{0,0},{0,0}},--{{-0.25, -0.25}, {0.25, 0.15625}},
    vertical_window_bounding_box = {{0,0},{0,0}},--{{-0.28125, -0.40625}, {0.03125, 0.125}}
}, 
{
    type = "smart-container",
    name = "smart-tank",
	icon = "__Smart-Circuit-Systems__/graphics/smart-tank-icon.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
	fast_replaceable_group = "pipe",
	minable = { hardness = 0.2, mining_time = 0.5, result = "smart-tank" },
	corpse = "small-remnants",
	max_health = 60,
	resistances = 
	{
		{
			type = "fire",
			percent = 90
		}
	},
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
	selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
	inventory_size = 2,
	picture =
	{
		filename = "__Smart-Circuit-Systems__/graphics/smart-tank.png",
		priority = "extra-high",
		width = 25,
		height = 29,
		shift = {0.02, -0.48}
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
