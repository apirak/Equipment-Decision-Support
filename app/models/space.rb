class Space < ActiveRecord::Base
  belongs_to :site

  def self.build(name, description)
    department = Space.find_by_name(name)
    unless department
      department = Department.new({
        :name=> name,
        :description => description})
    else
      department.name = name
      department.description = description
    end
    if department.save
      return "Save space #{name}"
    else
      return "Can't save space #{name}"
    end
  end
end
