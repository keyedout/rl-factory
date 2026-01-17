

data:extend({
	{
      type = "item",
      name = "lead-plate",
      icon_size = 64, icon_mipmaps = 4,
      icon = "__rl-factory__/graphics/icons/lead-plate.png",
      pictures = {
        {filename="__rl-factory__/graphics/icons/lead-plate.png", size=64, scale=0.5},
      },
      subgroup = "raw-material",
      -- order = "b[chemistry]-ba[",
      stack_size = 50
  },
  {
      type = "item",
      name = "galena",
      icon_size = 64, icon_mipmaps = 4,
      icon = "__rl-factory__/graphics/icons/enriched-lead.png",
      pictures = {
        {filename="__rl-factory__/graphics/icons/enriched-lead.png", size=64, scale=0.5},
      },
      subgroup = "raw-resource",
      -- order = "[galena]",
      stack_size = 50
  },
  {
  	type = "recipe",
  	name="lead-plate",
  	enabled=true,
  	category="smelting",
  	subgroup="intermediate-product",
  	icon="__rl-factory__/graphics/icons/lead-plate.png",
  	main_product="lead-plate",
  	energy_required=32,
  	ingredients={{type="item",name="galena",amount=1}},
  	results={
  		{type="item",name="lead-plate",amount=1},
  		{type="item",name="sulfur",amount=1},
  	},
  	allow_productivity = true

  }

})