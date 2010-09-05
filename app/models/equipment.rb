class Equipment < ActiveRecord::Base
  belongs_to :ground_strength
  belongs_to :space
  belongs_to :department
  belongs_to :equipment_name
  belongs_to :size
  belongs_to :weight_limit

  def self.build(values)
    equipment = Equipment.find_by_vihicle_registration(values[:vehicle_registration])
    unless equipment
      equipment = Equipment.new(values)
    else
      equipment.update_attributes(values)
    end

    if equipment.save
      return "Save site #{equipment.vihicle_registration}"
    else
      return "Can't save site #{equipment.vihicle_registration}"
    end
  end
end
