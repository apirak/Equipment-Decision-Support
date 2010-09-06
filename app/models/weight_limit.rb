class WeightLimit < ActiveRecord::Base
  has_many :equipment_name

  def self.build(name, description)
    weight_limit = WeightLimit.find_by_name(name)
    unless weight_limit
      weight_limit = WeightLimit.new()
    end
    weight_limit.name = name
    weight_limit.description = description

    if weight_limit.save
      return "Save size #{weight_limit.name}"
    else
      return "Can't size space #{weight_limit.name}"
    end
  end
end