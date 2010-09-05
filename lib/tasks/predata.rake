require 'active_record'
require 'application_helper'

namespace :predata do

  # rake predata:add_department RAILS_ENV=production
  # rake predata:add_department RAILS_ENV=development --trace
  desc "Add default department to database"
  task(:add_department => :environment) do
    puts(Department.build({:title => "ศูนย์เครื่องมือกล",
          :name => "ศูนย์เครื่องมือกล",
          :description => "หน่วยงานบริการเครื่องจักรก่อสร้างขนาดใหญ่ สำนักงานก่อสร้างและบูรณะ สำนักการโยธา",
          :lat => 13.830266727253765, 
          :lng => 100.52416911506653,
          :remark => "remark",
          :department_group_id => 1,
          :synonym => "ศูนย์เครื่องมือกล",
          :location => "ถนนรัชดา แขวงประชานุกูล",
          :phone => "02911209"}))

    puts(Department.build({:title => "สถานีดับเพลิงดาวคะนอง",
          :name => "สถานีดับเพลิงดาวคะนอง",
          :description => "หน่วยงานสถานีดับเพลิงและกู้ภัยขนาดกลาง มีเครื่องมือและอุปกรณ์ค้นหาผู้ประสบภัย",
          :lat => 13.698981336063915,
          :lng => 100.46657502651215,
          :remark => "-",
          :department_group_id => 1,
          :synonym => "ดาวคะนอง",
          :location => "ถนนเอกชัย เขตจอมทอง",
          :phone => "024681671"}))

    puts(Department.build({:title => "สถานีดับเพลิงธนบุรี",
          :name => "สถานีดับเพลิงธนบุรี",
          :description => "หน่วยงานสถานีดับเพลิงและกู้ภัยขนาดใหญ่",
          :lat => 13.727243325849328,
          :lng => 100.48668086528778,
          :remark => "-",
          :department_group_id => 1,
          :synonym => "ธนบุรี",
          :location => "ถนนเทอดไท แขวงบางยี่เรือ เขตธนบุรี",
          :phone => "024653016"}))

    puts(Department.build({:title => "สถานีดับเพลิงสามเสน",
          :name => "สถานีดับเพลิงสามเสน",
          :description => "หน่วยงานสถานีดับเพลิงและกู้ภัยขนาดกลาง",
          :lat => 13.751501172239544,
          :lng => 100.50627900829315,
          :remark => "-",
          :department_group_id => 1,
          :synonym => "สามเสน",
          :location => "ถนนขาว แขวงวชิรพยาบาล ดุสิต",
          :phone => "022412391"}))

    puts(GroundStrength.build("strong", "พื้นผิวมีความแข็งแรงเพียงพอต่อการทำงาน"))
    puts(GroundStrength.build("soft", "พื้นผิวมีความอ่อนนุ่มต้องทำงานด้วยความระมัดระวัง"))
    puts(GroundStrength.build("very soft", "พื้นผิวอ่อนนุ่มเหมาะกับเครื่องจักรตีนตะขาบ"))

    puts(Site.build({ :title => "เกิดเหตุอาคารถล่ม ที่คณะวิศวะ จุฬาฯ",
          :name => "เกิดเหตุอาคารถล่ม ที่คณะวิศวะ จุฬาฯ",
          :description => "เป็นอาคารเรียนคอนกรีต ความสูง 3 ชั้น ไม่มีผู้ประสบภัย",
          :lat => 13.736998472343346,
          :lng => 100.53305625915527,
          :remark => "เป็นงานเข้าเคลีย์พื้นที่ จัดส่งเครื่องจักรเข้าพื้นที่ได้ทันที",
          :size_id => 1,
          :ground_strength_id => 1,
          :dissaster_id => 4,
          :rain => false,
          :night_time => true,
          :wind_hard => false,
          :power_source => false,
          :electric => true,
          :light => true,
          :lift_more_20_ton => false,
          :lift_limit_20_ton => true,
          :lift_limit_5_ton => true,
          :demolish => true,
          :move_mat => true,
          :repair_route => false,
          :site_clear => true}))

    puts(Staff.build({:department_id => 1,
          :code => "E-001",
          :firstname => "จงรัก",
          :surname => "ลัมภเวช",
          :nickname => "-",
          :email => "jongluck_l@bkk.com",
          :password => "12345",
          :phone => "029111208",
          :post => "นายช่างเครื่องกล 6",
          :ability => "หัวหน้าศูนย์เครื่องมือกล",
          :status => true,
          :remark => "remark"}))

    puts(Staff.build({:department_id => 1,
          :code => "E-002",
          :firstname => "ประยุทธ",
          :surname => "ชวนเชย",
          :nickname => "-",
          :email => "prayut_c@bkk.com",
          :password => "12345",
          :phone => "029111208",
          :post => "พนักงานขับรถยนต์",
          :ability => "ขับรถบรรทุกติดเครน",
          :status => true,
          :remark => "remark"}))

    puts(Staff.build({:department_id => 1,
          :code => "E-003",
          :firstname => "คุณเกษม",
          :surname => "อินทรพานิช",
          :nickname => "-",
          :email => "kunkasem_i@bkk.com",
          :password => "12345",
          :phone => "022454267",
          :post => "พนักงานขับเครื่องจักรขนาดเบา",
          :ability => "ขับรถขุด รถงับคอนกรีต และรถเจาะกระแทก",
          :status => true,
          :remark => "remark"}))

    puts(Staff.build({:department_id => 1,
          :code => "E-004",
          :firstname => "ภัสสร",
          :surname => "ธาราพันธ์",
          :nickname => "-",
          :email => "passorn_t@bkk.com",
          :password => "12345",
          :phone => "022454266",
          :post => "พนักงานขับเครื่องจักรขนาดเบา",
          :ability => "ขับรถขุด รถงับคอนกรีต และรถเจาะกระแทก",
          :status => true,
          :remark => "remark"}))

    puts(Staff.build({:department_id => 1,
          :code => "E-005",
          :firstname => "จงรัก",
          :surname => "ลัมภเวช",
          :nickname => "-",
          :email => "jongluck@bkk.com",
          :password => "12345",
          :phone => "029111208",
          :post => "หัวหน้าศูนย์เครื่องมือกล",
          :ability => "บังคับบัญชาและสั่งการทำงานเครื่องจักรในงานกู้ภัย",
          :status => true,
          :remark => "remark"}))

    puts(Size.build("small", "เครื่องจักรขนาดเล็ก"))
    puts(Size.build("medium", "เครื่องจักรขนาดกลาง"))
    puts(Size.build("Large", "เครื่องจักรขนาดใหญ่"))
    
    puts(WeightLimit.build("more_20", "เครื่องจักรขนาดเล็ก"))
    puts(WeightLimit.build("limit_20", "เครื่องจักรขนาดกลาง"))
    puts(WeightLimit.build("limit_5", "เครื่องจักรขนาดใหญ่"))

    puts(EquipmentName.build("tracter", "รถบรรเทาสาธารณภัย"))
    puts(EquipmentName.build("digger", "รถไฟฟ้าส่องสว่าง"))
    puts(EquipmentName.build("tracter", "รถเครน 4 ล้อยาง"))
    puts(EquipmentName.build("digger", "รถเครนล้อยางขนาดมากกว่า 4 ล้อเพลาเดียวด"))
    puts(EquipmentName.build("tracter", "รถเครนล้อยางขนาดมากกว่า 4 ล้อหลายเพลา"))
    puts(EquipmentName.build("digger", "รถขุดรถเครนตีนตะขาบ"))
    puts(EquipmentName.build("tracter", "รถเครนกู้ภัย 10 ล้อ ขนาด 45 ตันเมตร"))
    puts(EquipmentName.build("digger", "รถบรรทุกติดเครน"))
    puts(EquipmentName.build("tracter", "รถขุดตักไฮดรอลิคพร้อมหัวงับคอนกรีต"))
    puts(EquipmentName.build("digger", "รถขุดตักไฮดรอลิคพร้อมหัวเจาะกระแทก"))
    puts(EquipmentName.build("tracter", "รถเครน 4 ล้อยาง"))
    puts(EquipmentName.build("digger", "รถเครนล้อยางขนาดมากกว่า 4 ล้อเพลาเดียวด"))
    puts(EquipmentName.build("tracter", "รถเครนล้อยางขนาดมากกว่า 4 ล้อหลายเพลา"))
    puts(EquipmentName.build("digger", "รถขุดรถเครนตีนตะขาบ"))
    puts(EquipmentName.build("tracter", "รถเครนกู้ภัย 10 ล้อ ขนาด 45 ตันเมตร"))
    puts(EquipmentName.build("digger", "รถบรรทุกติดเครน"))
    puts(EquipmentName.build("tracter", "รถขุดตักไฮดรอลิคพร้อมหัวงับคอนกรีต"))
    puts(EquipmentName.build("digger", "รถขุดตักไฮดรอลิคพร้อมหัวเจาะกระแทก"))


    puts(Dissaster.build("Fire", "อัคคีภัย"))
    puts(Dissaster.build("Flood", "อุทกภัย"))
    puts(Dissaster.build("Strom", "วาตภัย"))
    puts(Dissaster.build("Earthquake", "ภัยจากแผ่นดินไหวและอาคารถล่ม"))
    puts(Dissaster.build("Drought", "ภัยแล้ง"))
    puts(Dissaster.build("Chemical hazard", "ภัยจากสารเคมีและวัตถุอันตราย"))
    puts(Dissaster.build("Transportation Hazard", "ภัยจากการคมนาคมและขนส่ง"))
    puts(Dissaster.build("Epidemic", "ภัยจากโรคระบาดสัตว์และพืช"))
    puts(Dissaster.build("Terrorist", "ภัยจากการก่อวินาศกรรม"))
    puts(Dissaster.build("Riot", "ภัยจากการชุมนุมประท้วงและก่อการจราจล"))


    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 1,
          :weight_limit_id => 1,
          :size_id => 1,
          :code => "abc",
          :vihicle_registration => "xxy",
          :status => true,
          :specification => "Super mama",
          :remark => "Super Land",
          :electric => true,
          :light => true,
          :demolish => true,
          :move_mat => true,
          :repair_route => true,
          :site_clear => true,
          :move_vehecle => true,
          :track_line => true,}))

    puts(JobDescription.build(1,1, "driver", "ภัยจากการก่อวินาศกรรม"))
    puts(JobDescription.build(2,1, "water jet", "ภัยจากการชุมนุมประท้วงและก่อการจราจล"))
  end
end
