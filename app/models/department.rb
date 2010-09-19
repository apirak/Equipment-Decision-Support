class Department < Position
  has_one :space
  has_one :department_group
  has_many :staffs
  has_many :equipments
  
  belongs_to :department_job
  
  def self.column_models
    Position.column_models
  end

  def self.field_models
    Position.field_models
  end
  
  def self.create_all_temp_icon
    self.find(:all).each do |d|
      d.create_temp_icon
    end
  end
  
  def create_temp_icon
    if self.department_job
      self.icon = self.department_job.icon
      self.save
    end
  end

  def self.build(values)
    department = Department.find_by_description(values[:description])
    unless department
      department = Department.new(values)
    else
      department.update_attributes(values)
    end

    if department.save
      return "Save department #{department.description}"
    else
      return "Can't save department #{department.description}"
    end
  end
end
