require 'active_record'
require 'application_helper'

namespace :predata do

  # rake predata:add_department RAILS_ENV=production
  # rake predata:add_department RAILS_ENV=development --trace
  desc "Add default department to database"
  task(:add_department => :environment) do
    puts(Department.build({:title => "Super Department",
          :name => "Department 1",
          :description => "Department 1",
          :lat => 13.890911516432162, 
          :lng => 100.4473970800781,
          :remark => "remark",
          :department_group_id => 1,
          :department_class => "abc",
          :synonym => "ax",
          :location => "Sukumvit",
          :phone => "08487384"}))

    puts(Department.build({:title => "Super Department",
          :name => "Department 2",
          :description => "Department 2",
          :lat => 13.762895928509105, 
          :lng => 100.61631187499998,
          :remark => "remark",
          :department_group_id => 1,
          :department_class => "abc",
          :synonym => "ax",
          :location => "Sukumvit",
          :phone => "08487384"}))

    puts(Department.build({:title => "Super Department",
          :name => "Department 3",
          :description => "Department 3",
          :lat => 13.762895928509105, 
          :lng => 100.61631187499998,
          :remark => "remark",
          :department_group_id => 1,
          :department_class => "abc",
          :synonym => "ax",
          :location => "Sukumvit",
          :phone => "08487384"}))

    puts(Space.build("small", "พื้นที่มีความคับแคบเหมาะกับเครื่องจักรขนาดเล็ก"))
    puts(Space.build("medium", "จำกัดเพียงพอต่อการทำงานของเครื่องจักรขนาดกลางและขนาดเล็ก"))
    puts(Space.build("large", "พื้นที่กว้างขวางสามารถทำงานได้อย่างสะดวก"))

    puts(GroundStrength.build("strong", "พื้นผิวมีความแข็งแรงเพียงพอต่อการทำงาน"))
    puts(GroundStrength.build("soft", "พื้นผิวอ่อนนุ่มเหมาะกับเครื่องจักรตีนตะขาบ"))
    puts(GroundStrength.build("very soft", "พื้นผิวมีความอ่อนนุ่มต้องทำงานด้วยความระมัดระวัง"))

    puts(Site.build({ :title => "Abc",
          :name => "super",
          :description => "land",
          :lat => 13.890911516432162,
          :lng => 100.4473970800781,
          :remark => "dodo",
          :space_id => 1,
          :ground_strength_id => 1,
          :rain => false,
          :night_time => false,
          :wind_hard => true,
          :power_source => true}))

    puts(Staff.build({:department_id => 1,
          :code => "abd",
          :firstname => "Apirak",
          :surname => "Panatkool",
          :nickname => "bank",
          :email => "apirak@apirak.com",
          :password => "abc",
          :phone => "phone",
          :post => "post",
          :ability => "ability",
          :status => true,
          :remark => "remark"}))
    
  end
end


