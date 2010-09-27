class Site < Position
  belongs_to :ground_strength
  belongs_to :size
  belongs_to :dissaster
  belongs_to :weight_limit
  has_many   :equipment_name_sites
  
  def self.column_models
    Position.column_models
  end

  def self.field_models
    Position.field_models
  end  

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

  def self.test_all_site
    sites = Site.find(:all)
    sites.each do |s|
      puts "\n site name #{s.name}"
      s.suggest_equipment
    end
    return "done"
  end

  def suggest_equipment
    EquipmentNameSite.delete_all("position_id = #{id}")
    equipment_names = EquipmentName.find(:all)
    equipment_names.each do |e|
      e.point = work_matching(e)
      e.point = e.point + size_matching(e)
      e.point = e.point + ground_strength_matching(e)
      suggest_equipement, best_length = e.suggestEquipment(lat,lng)
      EquipmentNameSite.build(suggest_equipement.id, e.id, id, e.point, "ฺBest length #{best_length}")
    end

    rain_remark = "ขณะนี้มีฝนตกในพื้นที่เกิดเหตุโปรทำงานด้วยความระมัดระวัง"
    wind_hard_remark = "ขณะนี้มีลมแรงในพื้นที่เกิดเหตุโปรดระมัดระวังการทำงานในที่สูง"
    night_remark = "ให้เตรียมความพร้อมและทำงานด้วยความระมัดระวังเนื่องจากเป็นเป็นการทำงานในช่วงกลางคืน"
    power_ramark = "ให้เตรียมเชื้อเพลิงสำหรับเครื่องจักร์เข้าไปยังพื้นที่ปฏิบัติงานด้วย"

    remark = "#{remark} <li>#{rain_remark}</li>" if rain
    remark = "#{remark} <li>#{wind_hard_remark}</li>" if wind_hard
    remark = "#{remark} <li>#{night_remark}</li>" if night_time
    remark = "#{remark} <li>#{power_ramark}</li>" if power_source
    self.remark = "<ul>#{remark}</ul>"
    self.save
  end

  def work_matching(equipment)
    if (electric == equipment.electric) or
        (weight_limit_id == equipment.weight_limit_id) or
        (light == true and light == equipment.light) or
        (demolish == true and demolish == equipment.demolish) or
        (move_mat == true and move_mat == equipment.move_mat) or
        (repair_route == true and repair_route == equipment.repair_route) or
        (site_clear == true and site_clear == equipment.site_clear)
      return 67
    else
      return 0
    end
  end

  def size_matching(equipment)
    if size
      if (size.name == "small" and equipment.size.name == "small") or
          (size.name == "medium" and equipment.size.name != "large") or
          (size.name == "large")
        return 25
      end
    end
    return 5
  end

  def ground_strength_matching(equipment)
    if ground_strength
      if (ground_strength.name == "very soft" and equipment.track_line == true) or
          (ground_strength.name != "very soft")
        return 8
      end
    end
    return 5
  end

end
