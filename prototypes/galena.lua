-- Galena ore definition with proper autoplace settings

-- Initialize autoplace settings for galena ore
local resource_autoplace = require('resource-autoplace')

-- Initialize planet settings for galena ore
if data.raw.planet then
  data.raw.planet.nauvis.map_gen_settings.autoplace_controls["galena"] = {}
  data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["galena"] = {}
  resource_autoplace.initialize_patch_set("galena", true)
end

data:extend({
  {
    type = "autoplace-control",
    category = "resource",
    name = "galena",
    richness = true,
    -- order = "a-l"
  },
  {
    type = "resource",
    icon_size = 64, icon_mipmaps = 4,
    category="basic-solid",
    name = "galena",
    icon = "__rl-factory__/graphics/icons/lead-ore.png",
    flags = {"placeable-neutral"},
    -- order="a-b-a",
    map_color = {r=0.4, g=0.4, b=0.6},
    minable =
    {
      hardness = 1,
      mining_time = 1,
      result = "galena"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},

    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "galena",
      -- order = "a-t",
      base_density = 6,
      base_spots_per_km2 = 1,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1.2,
      starting_rq_factor_multiplier = 1.7,
    },

    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet = {
        filename = "__rl-factory__/graphics/entity/ores/hr-lead-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
  },
  
})

-- Modify galena autoplace richness for better distribution:
-- Up to 200 tiles it's standard
-- From 200 to 700 tiles, richness scales linearly down
-- From 700 tiles onward, it's about 1/6th the richness.
if data.raw.resource["galena"] and data.raw.resource["galena"].autoplace and data.raw.resource["galena"].autoplace.richness_expression then
  local richness = data.raw.resource["galena"].autoplace.richness_expression  
  data.raw.resource["galena"].autoplace.richness_expression = richness..[[*
if(distance_from_nearest_point{x = x, y = y, points = starting_positions} < 200, 1,
  if(distance_from_nearest_point{x = x, y = y, points = starting_positions} < 700,
    100/(distance_from_nearest_point{x = x, y = y, points = starting_positions} - 100), 0.17))
   ]]
end