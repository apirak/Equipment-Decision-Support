require 'active_record'
require 'application_helper'

namespace :predata do

  # rake predata:add_department RAILS_ENV=production
  # rake predata:add_department RAILS_ENV=development --trace
  desc "Add default department to database"
  task(:add_department => :environment) do
    puts(Department.build("Department 1", 13.890911516432162, 100.4473970800781))
    puts(Department.build("Department 2", 13.762895928509105, 100.61631187499998))
    puts(Department.build("Department 3", 13.850189124636994, 100.45553709082033))
  end
end