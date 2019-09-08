module TatoosHelper
  def next_item(all, current, direction)
    all[(all.index(current) + direction) % all.length]
  end

  CATEGORY_ALT_TEXT = [
    "psychodelic tattoo design",
    "thug life tattoo design",
    "radially symetric and radial tatoo design",
    "nirvana tatoo design",
    "beautiful tattoo design",
    "creepy tattoo design",
    "Famous tatoo design",
    "trans tattoo design"
  ]

  GENDER_ALT_TEXT = [
    "this is a tattoo for men",
    "this is a tattoo for women",
    "this is a tattoo for teens",
    "this is a tattoo for boys",
    "this is a tattoo for old",
    "this is a tattoo for shemale, trans gender"
  ]

  ORIENTATION_ALT_TEXT = [
    "this tattoo is for lesbians",
    "this tattoo is for gays",
    "straight tattoo",
    "this is a tatoo for black"
  ]

  DESIGN_ALT_TEXT = [
    "complex tatoo design",
    "rare tattoo design",
    "downloadable tattoo design",
    "small tattoo design",
    "big tattoo design"
  ]

  COST_ALT_TEXT = [
    "This is an expesive tattoo design",
    "This is a free tatoo design"
  ]
  def alt_text(tatoo)
    id = tatoo.id
    category = CATEGORY_ALT_TEXT[i%CATEGORY_ALT_TEXT.length]
    gender = GENDER_ALT_TEXT[i%GENDER_ALT_TEXT.length]
    orientation = ORIENTATION_ALT_TEXT[i%ORIENTATION_ALT_TEXT.length]
    design = DESIGN_ALT_TEXT[i%DESIGN_ALT_TEXT.length]
    cost = COST_ALT_TEXT[tattoo.premium? ? 1 : 0]
    "#{category}. #{cost}. #{gender}. #{design}. #{orientation}"
  end
end
