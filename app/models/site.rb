class Site < Position
  belongs_to :ground_strength
  belongs_to :size
  belongs_to :dissaster

  def self.build(values)
    site = Site.find_by_name(values[:code])
    values[:icon] = "cone_arrow_image"
    unless site
      site = Site.new(values)
    else
      site.update_attributes(values)
    end

    if site.save
      return "Save site #{site.name}"
    else
      return "Can't save site #{site.name}"
    end
  end

  def suggest_equipment
    equipments = EquipmentName.find(:all)
    equipments.each do |e|
      
    end
  end
end
