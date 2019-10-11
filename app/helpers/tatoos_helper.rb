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
    "trans tattoo design",
    "attractive tattoo design"
  ]

  GENDER_ALT_TEXT = [
    "this is a tattoo for men",
    "this is a tattoo for women",
    "this is a tattoo for girls",
    "this is a tattoo for boys",
    "this is a tattoo for mature",
    "this is a tattoo for pide trans gender"
  ]

  ORIENTATION_ALT_TEXT = [
    "this tattoo is for lesbians",
    "this tattoo is for gays",
    "suitable for anyone"
    "suitable for dark skin"
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

  PART_ALT_TEXT = [
    "Head", "Eye", "Ear", "Nose", "Nostril", "Mouth", "Lip",
    "Philtrum", "Jaw", "Mandible", "Gingiva", "Tooth", "Tongue",
    "Throat", "Adam's apple", "Vertebral column", "Arm", "Elbow",
    "Wrist", "Hand", "Fingers", "Thumb", "Nails", "Skin", "Hair",
    "Chest", "Breast Mammalia", "Abdomen (roughly Stomach)",
    "Sex organs", "Penis (male)", "Scrotum (male)", "Vulva (female)",
    "Leg", "Thigh", "Knee", "Kneecap", "Shinbone", "Calf",
    "Ankle", "Foot", "Dick", "Vagina", "Glance", "Ass", "Butt",
    "Navel", "Belly", "Nipple", "Chest", "Forehead", "Cheek",
    "Chin", "Lip", "Nose", "Neck", "Finger", "Feet", "Back",
    "Shoulder", "Armpit", "Clit"].map{|part| "this one is #{part} tattoo"}

  COST_SHORT_TAG = ['premium tatto', 'free tatto']
  GENDER_SHORT_TAG = ['for men', 'for women', 'for teens', 'for boys', 'for old', 'for pride transgenders']
  
  def title(tattoo)
    CATEGORY_ALT_TEXT[tatoo.id]
  end

  def alt_text(tatoo)
    id = tatoo.id
    category = CATEGORY_ALT_TEXT[id%CATEGORY_ALT_TEXT.length]
    gender = GENDER_ALT_TEXT[id%GENDER_ALT_TEXT.length]
    orientation = ORIENTATION_ALT_TEXT[id%ORIENTATION_ALT_TEXT.length]
    design = DESIGN_ALT_TEXT[id%DESIGN_ALT_TEXT.length]
    cost = COST_ALT_TEXT[tatoo.premium? ? 0 : 1]
    part = [id%61, id%50, id%30, id%10].uniq.map{|i| PART_ALT_TEXT[i]}.join('. ')
    "#{category}. #{cost}. #{gender}. #{design}. #{orientation}. #{part}"
  end

  def title_for(tatoo)
    return 'Radial Tattoos' unless tatoo
    id = tatoo.id
    cost = COST_SHORT_TAG[tatoo.premium? ? 0 : 1]
    gender = GENDER_SHORT_TAG[id%GENDER_ALT_TEXT.length]
    "#{cost} #{gender}"
  end
end
