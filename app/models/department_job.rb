class DepartmentJob < ActiveRecord::Base
  has_many :departments

  def self.build(values)
	model = this.find_by_name(values[:name])
	unless model
	  model = this.new(values)
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
