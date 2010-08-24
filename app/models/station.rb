class Station < Position
  
  def self.column_models
    Position.column_models
  end

  def self.field_models
    Position.field_models
  end

  def self.build(description, lat, lng)
    station = Station.find_by_description(description)
    unless station
      station = Station.new({:description => description,
          :icon=> "cone_arrow_image",
          :lat => lat,
          :lng => lng})
    else
      station.lat = lat
      station.lng = lng
    end
    if station.save
      return "Save station #{description}"
    else
      return "Can't save station #{description}"
    end
  end
end