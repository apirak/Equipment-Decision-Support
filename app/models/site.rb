class Site < Position
  belongs_to :ground_strength
  belongs_to :space
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
end
