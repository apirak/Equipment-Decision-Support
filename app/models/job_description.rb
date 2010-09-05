class JobDescription < ActiveRecord::Base
  belongs_to :Staff
  belongs_to :Equipment

  def self.build(staff_id, equipment_id, name, description)
    job_description = JobDescription.find(:first,
      :conditions => ["staff_id = ? and equipment_id = ?", staff_id, equipment_id])
    unless job_description
      job_description = JobDescription.new()
    end
    job_description.staff_id = staff_id
    job_description.equipment_id = equipment_id
    job_description.name = name
    job_description.description = description

    if job_description.save
      return "Save size #{job_description.name}"
    else
      return "Can't size space #{job_description.name}"
    end
  end
end