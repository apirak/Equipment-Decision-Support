class EquipmentName < ActiveRecord::Base
  has_many :equipment
  has_many :equipment_name_sites
  
  belongs_to :size
  belongs_to :weight_limit
  belongs_to :equipment_name

  attr_accessor :point

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
end
