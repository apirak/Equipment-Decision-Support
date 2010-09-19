class EquipmentName < ActiveRecord::Base
  has_many :equipments
  has_many :equipment_name_sites
  has_many :departments, :through => :equipments
  
  belongs_to :size
  belongs_to :weight_limit
  belongs_to :equipment_name

  attr_accessor :point
  
  def department_ids
    ids = []
    departments.each do |d|
      ids << d.id
    end
    ids.join(",")
  end

  def self.build(values)
    equipment_name = EquipmentName.find_by_name(values[:name])
    unless equipment_name
      equipment_name = EquipmentName.new(values)
    else
      equipment_name.update_attributes(values)
    end

    if equipment_name.save
      return "Save site #{equipment_name.name}"
    else
      return "Can't save site #{equipment_name.name}"
    end
  end
  
  def suggestEquipment(lat, lng)
    best_length = 0
    best_equipment = nil
    equipments.each do |e|
      if e.department
        aa = (e.department.lat - lat)*(e.department.lat - lat)
        bb = (e.department.lng - lng)*(e.department.lng - lng)
        length = Math.sqrt(aa + bb)
        logger.debug("\n\n\n\n\n Best length #{length} \n\n\n\n\n")
        if (best_length ==0) || (length < best_length)
          best_length = length
          best_equipment = e
        end
      end
    end
    return best_equipment, best_length  
  end
end
