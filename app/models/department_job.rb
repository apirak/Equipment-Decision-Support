class DepartmentJob < ActiveRecord::Base
  has_many :departments
  
  after_save :update_all_department
  
  def update_all_department
  	Department.create_all_temp_icon
  end

  def self.build(values)
	model = self.find_by_name(values[:name])
	unless model
	  model = self.new(values)
	else
	  model.update_attributes(values)
	end

	if model.save
	  return "Save #{model.class} #{model.name}"
	else
	  return "Can't save #{model.class} #{model.name}"
	end
  end
end
