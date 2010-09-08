class EquipmentNameSite < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :equipment_name
  belongs_to :position

  def self.build(equipment_id, equipment_name_id, position_id, score, remark)
    enp = EquipmentNameSite.find(:first,
      :conditions => ["position_id = ? and equipment_id = ? and equipment_name_id =?",
        position_id, equipment_id, equipment_name_id])
    unless enp
      enp = EquipmentNameSite.new()
    end
    enp.equipment_id = equipment_id
    enp.equipment_name_id = equipment_name_id
    enp.position_id = position_id
    enp.score = score
    enp.remark = remark

    if enp.save
      return "Save equipment name position #{enp.equipment_id}"
    else
      return "Can't equipment name position #{enp.equipment_id}"
    end
  end
end
