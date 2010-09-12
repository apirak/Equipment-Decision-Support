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
      puts "equipment name #{e.name} score is #{e.point}"
      EquipmentNameSite.build(nil, e.id, id, e.point, "")
    end

    rain_remark = "พื้นที่ทำงานขณะนี้มีลมแรงโประระมัดระวังการทำงานในที่สูง"
    night_remark = "เป็นการทำงานต่อเนื่องที่ยาวไปถึงช่วงกลางคืน หรือเป็นการทำงานตอนกลางคืน"
    power_ramark = "ในพื้นที่ทำงานไม่มีเชื้อเพลิงหรือมีไม่เพียงพอ ให้จัดเตรียมเชื้อเพลิงสำหรับเครื่องจักร์เข้าไปยังพื้นที่ปฏิบัติงาน"

    remark = "#{remark} #{rain_remark}" if rain
    remark = "#{remark} #{night_remark}" if night_time
    remark = "#{remark} #{power_ramark}" if power_source
    
    save
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
    if (size.name == "small" and equipment.size.name == "small") or
        (size.name == "medium" and equipment.size.name != "large") or
        (size.name == "large")
      return 25
    else
      return 5
    end
  end

  def ground_strength_matching(equipment)
    if (ground_strength.name == "very soft" and equipment.track_line == true) or
        (ground_strength.name != "very soft")
      return 8
    else
      return 5
    end
  end

end
