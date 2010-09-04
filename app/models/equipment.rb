class Equipment < ActiveRecord::Base
  belongs_to :ground_strength
  belongs_to :space
  belongs_to :department
  belongs_to :equipment_name
  belongs_to :size

  def self.build(values)
    equipment = Equipment.find_by_vehicle_registration(values[:vehicle_registration])
    unless equipment
      equipment = Equipment.new(values)
    else
      equipment.update_attributes(values)
    end

    if equipment.save
      return "Save site #{equipment.vehicle_registration}"
    else
      return "Can't save site #{equipment.vehicle_registration}"
    end
  end
end
