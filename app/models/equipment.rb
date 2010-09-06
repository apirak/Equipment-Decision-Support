class Equipment < ActiveRecord::Base
  belongs_to :department
  belongs_to :equipment_name

  has_many   :job_descriptions
  has_many   :staffs, :through => :job_descriptions

  def self.build(values)
    equipment = Equipment.find_by_vehicle_registration(values[:vehicle_registration])
    unless equipment
      equipment = Equipment.new(values)
    else
      equipment.update_attributes(values)
    end

    if equipment.save
      return "Save equipment #{equipment.vehicle_registration}"
    else
      return "Can't equipment site #{equipment.vehicle_registration}"
    end
  end
end
