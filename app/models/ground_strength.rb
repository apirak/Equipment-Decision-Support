class GroundStrength < ActiveRecord::Base
  has_many :sites

  def self.build(name, description)
    ground_strength = GroundStrength.find_by_name(name)
    unless ground_strength
      ground_strength = GroundStrength.new()
    end
    ground_strength.name = name
    ground_strength.description = description

    if ground_strength.save
      return "Save GroundStrength #{name}"
    else
      return "Can't save GroundStrength #{name}"
    end
  end
end
