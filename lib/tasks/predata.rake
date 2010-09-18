require 'active_record'
require 'application_helper'

namespace :predata do

  # rake predata:add_department RAILS_ENV=production
  # rake predata:add_department RAILS_ENV=development --trace
  desc "Add default department to database"
  task(:add_department => :environment) do
    puts(Department.build({:title => "ศูนย์เครื่องมือกล",
          :department_job_id => 1,
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
          :department_job_id => 2,
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
          :department_job_id => 2,
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
          :department_job_id => 2,
    	  :name => "สถานีดับเพลิงสามเสน",
          :description => "หน่วยงานสถานีดับเพลิงและกู้ภัยขนาดกลาง",
          :lat => 13.751501172239544,
          :lng => 100.50627900829315,
          :remark => "-",
          :department_group_id => 1,
          :synonym => "สามเสน",
          :location => "ถนนขาว แขวงวชิรพยาบาล ดุสิต",
          :phone => "022412391"}))

    puts(Department.build({:title => "กองโรงงานช่างกล",
          :department_job_id => 1,
    	  :name => "กองโรงงานช่างกล",
          :description => "รับผิดชอบงานบำรุงรักษาเครื่องจักรกล และเก็บรักษาเครื่องจักร",
          :lat => 13.768617,
          :lng => 100.552703,
          :remark => "-",
          :department_group_id => 1,
          :synonym => "สามเสน",
          :location => "ถนนมิตรไมตรี ดินแดง",
          :phone => "0 2245 3301"}))

    puts(GroundStrength.build("hard", "พื้นผิวมีความแข็งแรงเพียงพอต่อการทำงาน"))
    puts(GroundStrength.build("soft", "พื้นผิวมีความอ่อนนุ่มต้องทำงานด้วยความระมัดระวัง"))
    puts(GroundStrength.build("very soft", "พื้นผิวอ่อนนุ่มเหมาะกับเครื่องจักรตีนตะขาบ"))

    puts(Site.build({ :title => "เกิดเหตุอาคารถล่ม ที่คณะวิศวะ จุฬาฯ",
    	  :department_job_id => 7,      
    	  :name => "เกิดเหตุอาคารถล่ม ที่คณะวิศวะ จุฬาฯ",
          :description => "เป็นอาคารเรียนคอนกรีต ความสูง 3 ชั้น ไม่มีผู้ประสบภัย",
          :location => "ถนนพญาไท จุฬาลงกรณ์มหาวิทยาลัย",
          :lat => 13.736998472343346,
          :lng => 100.53305625915527,
          :remark => "เป็นงานเข้าเคลีย์พื้นที่ จัดส่งเครื่องจักรเข้าพื้นที่ได้ทันที",
          :size_id => 3,
          :ground_strength_id => 1,
          :dissaster_id => 4,
          :rain => false,
          :night_time => true,
          :wind_hard => false,
          :power_source => false,
          :electric => true,
          :light => true,
          :weight_limit_id => 2,
          :demolish => true,
          :move_mat => true,
          :repair_route => false,
          :site_clear => true}))

    puts(Site.build({ :title => "เกิดเหตุอาคารถล่ม เคหะชุมชนดินแดง1",
          :department_job_id => 7,
    	  :name => "เกิดเหตุอาคารถล่ม เคหะชุมชนดินแดง1",
          :description => "เป็นอาคารที่พักอาศัยคอนกรีต ความสูง 6 ชั้น มีผู้ประสบภัยติดอยู่ภายใน",
          :location => "ประชาสงเคราะห์ซอย5 ถนนประชาสงเคราห์ ดินแดง",
          :lat => 13.764331,
          :lng => 100.5495,
          :remark => "งานสนับสนุนความช่วยเหลือเจ้าหน้าที่กู้ภัย",
          :size_id => 2,
          :ground_strength_id => 1,
          :dissaster_id => 4,
          :rain => false,
          :night_time => true,
          :wind_hard => false,
          :power_source => true,
          :electric => true,
          :light => true,
          :weight_limit_id => 1,
          :demolish => true,
          :move_mat => true,
          :repair_route => false,
          :site_clear => false}))

    puts(Site.build({ :title => "เกิดเหตุอาคารถล่ม เคหะชุมชนดินแดง2",
          :department_job_id => 7,
    	  :name => "เกิดเหตุอาคารถล่ม เคหะชุมชนดินแดง2",
          :description => "เป็นอาคารที่พักอาศัยคอนกรีต ความสูง 4 ชั้น มีผู้ประสบภัยติดอยู่ภายใน",
          :location => "ประชาสงเคราะห์ซอย5 ถนนประชาสงเคราห์ ดินแดง",
          :lat => 13.764336,
          :lng => 100.5495,
          :remark => "งานสนับสนุนความช่วยเหลือเจ้าหน้าที่กู้ภัย",
          :size_id => 1,
          :ground_strength_id => 2,
          :dissaster_id => 4,
          :rain => false,
          :night_time => true,
          :wind_hard => false,
          :power_source => true,
          :electric => true,
          :light => true,
          :weight_limit_id => 3,
          :demolish => true,
          :move_mat => true,
          :repair_route => false,
          :site_clear => false}))


    puts(Staff.build({:department_id => 1,
          :code => "E-001",
          :firstname => "จงรัก",
          :surname => "ลัมภเวช",
          :nickname => "-",
          :email => "jongluck_l@bkk.com",
          :password => "12345",
          :phone => "029111208",
          :post => "นายช่างเครื่องกล 6",
          :ability => "ผู้ควบคุมงาน",
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
          :firstname => "วราพงษ์",
          :surname => "บำเพ็ญบุญ",
          :nickname => "-",
          :email => "-",
          :password => "-",
          :phone => "029111208",
          :post => "พนักงานขับรถ",
          :ability => "ขับรถเทรลเลอร์",
          :status => true,
          :remark => "remark"}))

    puts(Staff.build({:department_id => 1,
          :code => "E-006",
          :firstname => "สมศักดิ์",
          :surname => "ชัยวงษ์",
          :nickname => "-",
          :email => "-",
          :password => "-",
          :phone => "029111208",
          :post => "พนักงานควบคุมเครื่องจักร",
          :ability => "พนักงานประจำรถเครน",
          :status => true,
          :remark => "remark"}))

    puts(Staff.build({:department_id => 1,
          :code => "E-007",
          :firstname => "ปุณณะ",
          :surname => "พรหมราช",
          :nickname => "-",
          :email => "-",
          :password => "-",
          :phone => "029111208",
          :post => "พนักงานขับเครื่องจักรเบา",
          :ability => "ขับรถตักล้อยาง",
          :status => true,
          :remark => "remark"}))

    puts(Staff.build({:department_id => 1,
          :code => "E-008",
          :firstname => "จรัญ",
          :surname => "ดารารุ่ง",
          :nickname => "-",
          :email => "-",
          :password => "-",
          :phone => "029111208",
          :post => "พนักงานขับเครื่องจักรเบา",
          :ability => "คนขัยรถเกรด",
          :status => true,
          :remark => "remark"}))

    puts(Staff.build({:department_id => 1,
          :code => "E-009",
          :firstname => "ประยูร",
          :surname => "บุญเจริญ",
          :nickname => "-",
          :email => "-",
          :password => "-",
          :phone => "029111208",
          :post => "พนักงานขับเครื่องจักรเบา",
          :ability => "ขับรถ 6 ล้อ",
          :status => true,
          :remark => "remark"}))

    puts(Staff.build({:department_id => 1,
          :code => "E-010",
          :firstname => "องอาจ",
          :surname => "แจ้งเกษตร",
          :nickname => "-",
          :email => "-",
          :password => "-",
          :phone => "029111208",
          :post => "พนักงานขับเครื่องจักรเบา",
          :ability => "ขับรถขุด รถงับคอนกรีต และรถเจาะกระแทก",
          :status => true,
          :remark => "remark"}))

    puts(Staff.build({:department_id => 1,
          :code => "E-011",
          :firstname => "ปัญญา",
          :surname => "เพ็งขาว",
          :nickname => "-",
          :email => "-",
          :password => "-",
          :phone => "029111208",
          :post => "พนักงานควบคุมเครื่องจักร",
          :ability => "พนักงานประจำรถเครน",
          :status => true,
          :remark => "remark"}))

    puts(Staff.build({:department_id => 1,
          :code => "E-012",
          :firstname => "สมชาย",
          :surname => "สุขีวัน",
          :nickname => "-",
          :email => "-",
          :password => "-",
          :phone => "029111208",
          :post => "พนักงานขับเครื่องจักรเบา",
          :ability => "ขับรถขุด รถงับคอนกรีต และรถเจาะกระแทก",
          :status => true,
          :remark => "remark"}))

    puts(Staff.build({:department_id => 1,
          :code => "E-013",
          :firstname => "ถนอม",
          :surname => "ใยบัว",
          :nickname => "-",
          :email => "-",
          :password => "-",
          :phone => "029111208",
          :post => "พนักงานขับรถ",
          :ability => "ขับรถเทรลเลอร์",
          :status => true,
          :remark => "remark"}))

    puts(Staff.build({:department_id => 1,
          :code => "E-014",
          :firstname => "เพทาย",
          :surname => "วิบูรณ์ชาติ",
          :nickname => "-",
          :email => "-",
          :password => "-",
          :phone => "029111208",
          :post => "พนักงานขับรถเคร",
          :ability => "ขับรถเครนขนาดใหญ่",
          :status => true,
          :remark => "remark"}))


    puts(Size.build("small", "เครื่องจักรขนาดเล็ก"))
    puts(Size.build("medium", "เครื่องจักรขนาดกลาง"))
    puts(Size.build("large", "เครื่องจักรขนาดใหญ่"))

    puts(WeightLimit.build("more_20", "เครื่องจักรขนาดเล็ก"))
    puts(WeightLimit.build("limit_20", "เครื่องจักรขนาดกลาง"))
    puts(WeightLimit.build("limit_5", "เครื่องจักรขนาดใหญ่"))

   puts(EquipmentName.build({:name => "Mitigation Truck",
        :name_th => "รถบรรเทาสาธารณภัย",
        :specification => "เป็นรถขนาด 10 ล้อ มีอุปกรณ์กู้ภัย ปั่นไฟ เครน และไฟส่องสว่างขนาด 1500Wx9 ดวง",
        :size_id => 2,
        :weight_limit_id => 2,
        :electric => true,
        :light => true,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => false,
        :track_line => false}))

    puts(EquipmentName.build({:name => "Light Truck",
        :name_th => "รถไฟฟ้าส่องสว่าง",
        :specification => "รถไฟฟ้าส่องสว่างขนาด 6 ล้อ ติดไฟ 1500Wx6 ดวง",
        :size_id => 2,
        :weight_limit_id => 0,
        :electric => true,
        :light => true,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => false,
        :track_line => false,}))
        
	puts(EquipmentName.build({:name => "Light Truck-2",
        :name_th => "รถไฟฟ้าส่องสว่าง-2",
        :specification => "รถไฟฟ้าส่องสว่างขนาด 6 ล้อ ติดไฟ 1500Wx6 ดวง",
        :size_id => 2,
        :weight_limit_id => 0,
        :electric => true,
        :light => true,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => false,
        :track_line => false,}))
        
   	puts(EquipmentName.build({:name => "Light Truck-3",
        :name_th => "รถไฟฟ้าส่องสว่าง-3",
        :specification => "รถไฟฟ้าส่องสว่างขนาด 6 ล้อ ติดไฟ 1500Wx6 ดวง",
        :size_id => 2,
        :weight_limit_id => 0,
        :electric => true,
        :light => true,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => false,
        :track_line => false,}))

    puts(EquipmentName.build({:name => "Rough Terrain Crane",
        :name_th => "รถเครน 4 ล้อยาง",
        :specification => "รถยกขนาดไม่ต่ำกว่า 50 ตันเมตร",
        :size_id => 3,
        :weight_limit_id => 1,
        :electric => true,
        :light => true,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => false,
        :track_line => false,}))

    puts(EquipmentName.build({:name => "Truck Crane",
        :name_th => "รถเครนล้อยางขนาดมากกว่า 4 ล้อเพลาเดียว",
        :specification => "รถยกขนาดไม่ต่ำกว่า 50 ตันเมตร",
        :size_id => 3,
        :weight_limit_id => 1,
        :electric => false,
        :light => false,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => false,
        :track_line => false,}))

    puts(EquipmentName.build({:name => "All Terrain Crane",
        :name_th => "รถเครนล้อยางขนาดมากกว่า 4 ล้อหลายเพลา",
        :specification => "รถยกขนาดไม่ต่ำกว่า 50 ตันเมตร",
        :size_id => 3,
        :weight_limit_id => 1,
        :electric => false,
        :light => false,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => false,
        :track_line => false,}))

    puts(EquipmentName.build({:name => "Crawler Crane",
        :name_th => "รถขุดรถเครนตีนตะขาบ",
        :specification => "รถยกขนาดไม่ต่ำกว่า 50 ตันเมตร",
        :size_id => 3,
        :weight_limit_id => 1,
        :electric => false,
        :light => false,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => false,
        :track_line => true,}))

    puts(EquipmentName.build({:name => "Rescue Truck Crane",
        :name_th => "รถเครนกู้ภัย 10 ล้อ ขนาด 45 ตันเมตร",
        :specification => "รถยกลากกู้ภัยขนาด 10 ล้อ",
        :size_id => 2,
        :weight_limit_id => 2,
        :electric => false,
        :light => false,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => false,
        :track_line => false,}))

    puts(EquipmentName.build({:name => "Loader Crane",
        :name_th => "รถบรรทุกติดเครน",
        :specification => "รถเฮียบขนาด 6 ล้อ",
        :size_id => 1,
        :weight_limit_id => 3,
        :electric => false,
        :light => false,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => false,
        :track_line => false,}))

    puts(EquipmentName.build({:name => "Excavator with Concrete Pulverizer",
       :name_th => "รถขุดตักไฮดรอลิคพร้อมหัวงับคอนกรีต",
       :specification => "รถขุด Komatsu PC220",
        :size_id => 3,
        :weight_limit_id => 0,
        :electric => false,
        :light => false,
        :demolish => true,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => false,
        :track_line => true,}))

    puts(EquipmentName.build({:name => "Excavator with Hydraulic Breaker",
        :name_th => "รถขุดตักไฮดรอลิคพร้อมหัวเจาะกระแทก",
        :specification => "รถขุดล้อยางขนาด Komatsu PW100",
        :size_id => 1,
        :weight_limit_id => 0,
        :electric => false,
        :light => false,
        :demolish => true,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => false,
        :track_line => false,}))

    puts(EquipmentName.build({:name => "Excavator",
        :name_th => "รถขุดตักไฮดรอลิคพร้อมหัวขุด",
        :specification => "รถขุด Komatsu PC200",
        :size_id => 2,
        :weight_limit_id => 0,
        :electric => false,
        :light => false,
        :demolish => false,
        :move_mat => true,
        :repair_route => true,
        :site_clear => true,
        :move_vehicle => false,
        :track_line => true,}))

    puts(EquipmentName.build({:name => "Wheeled Loader",
        :name_th => "รถตักล้อยาง",
        :specification => "รถตักล้อยาง Volvo L90B",
        :size_id => 2,
        :weight_limit_id => 0,
        :electric => false,
        :light => false,
        :demolish => false,
        :move_mat => false,
        :repair_route => true,
        :site_clear => true,
        :move_vehicle => false,
        :track_line => false,}))

    puts(EquipmentName.build({:name => "Grader",
        :name_th => "รถเกรด",
        :specification => "รถเกรดล้อยาง Komatsu",
        :size_id => 3,
        :weight_limit_id => 0,
        :electric => false,
        :light => false,
        :demolish => false,
        :move_mat => false,
        :repair_route => true,
        :site_clear => true,
        :move_vehicle => false,
        :track_line => false,}))

    puts(EquipmentName.build({:name => "Electrical Generator",
        :name_th => "เครื่องกำเนิดไฟฟ้า",
        :specification => "เครื่องกำเนิดไฟฟ้าและรถไฟฟ้าส่องสว่างขนาด 6 ล้อ",
        :size_id => 1,
        :weight_limit_id => 0,
        :electric => true,
        :light => false,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => false,
        :track_line => false,}))

    puts(EquipmentName.build({:name => "dump Truck",
        :name_th => "รถบรรทุกเทท้าย",
        :specification => "รถบบรทุกเทท้ายขนาด 10 ล้อ",
        :size_id => 2,
        :weight_limit_id => 0,
        :electric => false,
        :light => false,
        :demolish => false,
        :move_mat => true,
        :repair_route => true,
        :site_clear => true,
        :move_vehicle => false,
        :track_line => false,}))

    puts(EquipmentName.build({:name => "Lowbed Semi-Trailer 22 wheel",
        :name_th => "รถกึ่งพ่วงชานต่ำขนาด 22 ล้อ",
        :specification => "รถเทรลเลอร์ ขนาด 45 ตัน",
        :size_id => 3,
        :weight_limit_id => 0,
        :electric =>false,
        :light => false,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => true,
        :track_line => false,}))

    puts(EquipmentName.build({:name => "Lowbed Semi-Trailer 18 wheel",
        :name_th => "รถกึ่งพ่วงชานต่ำขนาด 18 ล้อ",
        :specification => "รถเทรลเลอร์ ขนาด 25 ตัน",
        :size_id => 3,
        :weight_limit_id => 0,
        :electric =>false,
        :light => false,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => true,
        :track_line => false,}))

    puts(EquipmentName.build({:name => "Flatbed Truck",
        :name_th => "รถบรรทุก 10 ล้อท้ายลาด",
        :specification => "รถบรรทุก 10 ล้อ ขนาด 25 ตัน",
        :size_id => 2,
        :weight_limit_id => 0,
        :electric =>false,
        :light => false,
        :demolish => false,
        :move_mat => false,
        :repair_route => false,
        :site_clear => false,
        :move_vehicle => true,
        :track_line => false,}))

    puts(Dissaster.build("Fire", "อัคคีภัย"))
    puts(Dissaster.build("Flood", "อุทกภัย"))
    puts(Dissaster.build("Strom", "วาตภัย"))
    puts(Dissaster.build("Earthquake", "ภัยจากแผ่นดินไหวและอาคารถล่ม"))
    puts(Dissaster.build("Drought", "ภัยแล้ง"))
    puts(Dissaster.build("Chemical hazard", "ภัยจากสารเคมีและวัตถุอันตราย"))
    puts(Dissaster.build("Transportation hazard", "ภัยจากการคมนาคมและขนส่ง"))
    puts(Dissaster.build("Epidemic", "ภัยจากโรคระบาดสัตว์และพืช"))
    puts(Dissaster.build("Terrorist", "ภัยจากการก่อวินาศกรรม"))
    puts(Dissaster.build("Riot", "ภัยจากการชุมนุมประท้วงและก่อการจราจล"))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 1,
          :code => "ฟ.1",
          :vehicle_registration => "4ษ-4597",
          :status => true,
          :remark => "-"}))

    puts(Equipment.build({
        :department_id => 1,
        :equipment_name_id => 2,
        :code => "บภ.2",
        :vehicle_registration => "3ฎ-5260",
        :status => true,
        :remark => "-"}))
        
	puts(Equipment.build({
        :department_id => 4,
        :equipment_name_id => 3,
        :code => "-",
        :vehicle_registration => "xx-1111",
        :status => true,
        :remark => "-"}))
        
	puts(Equipment.build({
        :department_id => 3,
        :equipment_name_id => 4,
        :code => "-",
        :vehicle_registration => "xx-2222",
        :status => true,
        :remark => "-"}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 5,
          :code => "ย.1",
          :vehicle_registration => "1ก-1234",
          :status => true,
          :remark => "-"}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 6,
          :code => "ย.2",
          :vehicle_registration => "2ก-1234",
          :status => true,
          :remark => "-"}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 7,
          :code => "ย.3",
          :vehicle_registration => "3ก-1234",
          :status => true,
          :remark => "-"}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 8,
          :code => "ย.4",
          :vehicle_registration => "4ก-1234",
          :status => true,
          :remark => "-",}))

    puts(Equipment.build({
          :department_id => 2,
          :equipment_name_id => 9,
          :code => "14-2",
          :vehicle_registration => "99-0218",
          :status => true,
          :remark => "-",}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 10,
          :code => "ช.2",
          :vehicle_registration => "25-1124",
          :status => true,
          :remark => "-",}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 11,
          :code => "ข.8",
          :vehicle_registration => "4ต-6634",
          :status => true,
          :remark => "-",}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 12,
          :code => "ข.10",
          :vehicle_registration => "ตฉ-3977",
          :status => true,
          :remark => "-",}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 13,
          :code => "ข.14",
          :vehicle_registration => "ตฉ-3978",
          :status => true,
          :remark => "-",}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 14,
          :code => "ต.12",
          :vehicle_registration => "4ต-8272",
          :status => true,
          :remark => "-",}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 15,
          :code => "ก.1",
          :vehicle_registration => "4ต-4743",
          :status => true,
          :remark => "-",}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 16,
          :code => "ฟ.1",
          :vehicle_registration => "-",
          :status => true,
          :remark => "-",}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 17,
          :code => "1ย-127",
          :vehicle_registration => "95-1110",
          :status => true,
          :remark => "-",}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 18,
          :code => "ทล.5+ห.5",
          :vehicle_registration => "4ต-4677",
          :status => true,
          :remark => "-",}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 19,
          :code => "ทล.9+ห.8",
          :vehicle_registration => "4ต-6773",
          :status => true,
          :remark => "-",}))

    puts(Equipment.build({
          :department_id => 1,
          :equipment_name_id => 20,
          :code => "ทล.21",
          :vehicle_registration => "95-4521",
          :status => true,
          :remark => "-",}))

    puts(JobDescription.build(2, 1, "คนขับ", "ให้ไปสนับสนุนงานด้านไฟฟ้า แสงสว่าง และอุปกรณ์ค้นหาผู้ประสบภัย"))
    puts(JobDescription.build(13, 2, "คนขับ", "ให้ไปสนับสนุนงานด้านไฟฟ้า แสงสว่าง"))
    puts(JobDescription.build(9, 3, "คนขับ", "ให้ไปยกซากคอนกรีตขนาดใหญ่ที่พังถล่ม"))
    puts(JobDescription.build(2, 3, "คนควบคุม", "ให้ไปยกซากคอนกรีตขนาดใหญ่ที่พังถล่ม"))
    puts(JobDescription.build(3, 4, "คนขับ", "ให้ไปยกซากคอนกรีตขนาดใหญ่ที่พังถล่ม"))
    puts(JobDescription.build(6, 4, "คนควบคุม", "ให้ไปยกซากคอนกรีตขนาดใหญ่ที่พังถล่ม"))
    puts(JobDescription.build(11, 5, "คนขับ", "ให้ไปยกซากคอนกรีตขนาดใหญ่ที่พังถล่ม"))
    puts(JobDescription.build(4, 5, "คนควบคุม", "ให้ไปยกซากคอนกรีตขนาดใหญ่ที่พังถล่ม"))
    puts(JobDescription.build(11, 6, "คนขับ", "ให้ไปยกซากคอนกรีตขนาดใหญ่ที่พังถล่ม"))
    puts(JobDescription.build(6, 6, "คนควบคุม", "ให้ไปยกซากคอนกรีตขนาดใหญ่ที่พังถล่ม"))
    puts(JobDescription.build(12, 7, "คนขับ", "ให้ไปลากยกลากรถที่พังเสียหายในพื้นที่เกิดเหตุ"))
    puts(JobDescription.build(6, 8, "คนขับ", "ให้ไปขนเครื่องอุปโภคบริโภคไปยังพื้นที่ประสบภัย"))
    puts(JobDescription.build(4, 9, "คนขับ", "ให้ไปรื้อทำรายอาคารคอนกรีตที่ได้รับความเสียหายรุนแรง"))
    puts(JobDescription.build(10, 10, "คนขับ", "ให้ไปรื้อทำรายอาคารคอนกรีตที่ได้รับความเสียหายรุนแรง"))
    puts(JobDescription.build(3, 11, "คนขับ", "ให้ไปขุดปรับพื้นที่เกิดเหตุ และช่วยงานขนย้ายวัสดุ"))
    puts(JobDescription.build(7, 12, "คนขับ", "ให้ไปขุดปรับพื้นที่เกิดเหตุ และช่วยงานขนย้ายวัสดุ"))
    puts(JobDescription.build(8, 13, "คนขับ", "ให้เข้าไปปรับพื้นที่เตรียมจัดตั้งศูนย์อำนวยการ"))
    puts(JobDescription.build(2, 14, "คนขับ", "ไปจ่ายไฟให้กับศูนย์อำนวยการ"))
    puts(JobDescription.build(9, 15, "คนขับ", "ให้ไปช่วยงานขนย้ายวัสดุ และอุปกรณ์การทำงาน"))
    puts(JobDescription.build(5, 16, "คนขับ", "ให้ไปขนย้ายเครื่องจักรขนาดใหญ่"))
    puts(JobDescription.build(13, 17, "คนขับ", "ให้ไปขนย้ายเครื่องจักรขนาดกลาง"))
    puts(JobDescription.build(9, 18, "คนขับ", "ให้ไปขนย้ายเครื่องจักรขนาดเล็ก"))

    puts(EquipmentNameSite.build(1,1,8,100, "remark 1"))
    puts(EquipmentNameSite.build(1,2,8,80, "remark 2"))
    puts(EquipmentNameSite.build(1,3,6,60, "remark 3"))    
    puts(EquipmentNameSite.build(1,3,8,60, "remark 4")) 
    
    puts(DepartmentJob.build(:name => "Public Work Department", :description => "สำนักการโยธา กทม.", :icon => "EquipmentCenter"))
    puts(DepartmentJob.build(:name => "Bangkok Fire&Rescue", :description => "สปภ. กทม.และ สถานีดับเพลิง", :icon => "BkkFireRescue"))
    puts(DepartmentJob.build(:name => "Other Department of Bangkok Administration", :description => "หน่วยงานรัฐของ กทม.", :icon => "xx"))
    puts(DepartmentJob.build(:name => "Department of Disaster Prevention & Mitigation", :description => "กรมป้องกันและบรรเทาสาธารณภัย", :icon => "DisasterPrevention"))
    puts(DepartmentJob.build(:name => "Emergency Medical Sevice", :description => "ศูนย์ช่วยชีวิตฉุกเฉิน", :icon => "Hospital"))
    puts(DepartmentJob.build(:name => "Other Department", :description => "หน่วยงานอื่นๆ", :icon => "OtherDept"))
    puts(DepartmentJob.build(:name => "Devasted Area", :description => "พื้นที่เกิดเหตุ", :icon => "DevastedArea"))
  end
end