class Staff < ActiveRecord::Base
  belongs_to :department

  netzke_attribute :department_name
  def department_name
    if department
      return department.name
    end
    return ""
  end

  netzke_attribute :fullname
  def fullname
    return "#{firstname} #{surname}"
  end

  def self.build(values)
    staff = Staff.find_by_code(values[:code])
    unless staff
      department = Department.find(values[:department_id])
      staff = department.staffs.build(values)
    else
      staff.update_attributes(values)
    end

    if staff.save
      return "Save staff #{staff.firstname}"
    else
      return "Can't save staff #{staff.firstname}"
    end
  end
end


