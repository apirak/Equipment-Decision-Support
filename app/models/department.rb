class Department < Position
  has_one :space
  has_one :department_group
  
  def self.column_models
    Position.column_models
  end

  def self.field_models
    Position.field_models
  end

  def self.build(description, lat, lng)
    department = Department.find_by_description(description)
    unless department
      department = Department.new({
          :description => description,
          :icon=> "cone_arrow_image",
          :lat => lat,
          :lng => lng})
    else
      department.lat = lat
      department.lng = lng
    end
    if department.save
      return "Save Department #{description}"
    else
      return "Can't save department #{description}"
    end
  end
end
