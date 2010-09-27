class Equipment < ActiveRecord::Base
  belongs_to :department
  belongs_to :equipment_name

  has_many   :job_descriptions
  has_many   :equipment_name_sites
  has_many   :staffs, :through => :job_descriptions

  netzke_attribute :register_department
  def register_department
    if department
      return department.name
    end
    return ""
  end

  netzke_attribute :name_department
  def name_department
    if department
      return "#{equipment_name.name}:#{department.name}"
    end
  end
  
  def self.find_by_name_department(name_department)
    name_departments = name_department.split(":")
    equipment_name = name_departments[0]
    department_name = name_departments[1]

    department = Department.find_by_name(department_name)    
    equipment_name = EquipmentName.find_by_name(equipment_name)

    Equipment.find(:first, :conditions => ["department_id == ? and equipment_name_id ==? ", 
      department.id, equipment_name.id])
  end

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
