class EquipmentName < ActiveRecord::Base
  has_many :equipment

  def self.build(name, description)
    equipment_name = EquipmentName.find_by_name(name)
    unless equipment_name
      equipment_name = EquipmentName.new()
    end
    equipment_name.name = name
    equipment_name.description = description

    if equipment_name.save
      return "Save space #{name}"
    else
      return "Can't save space #{name}"
    end
  end
end
