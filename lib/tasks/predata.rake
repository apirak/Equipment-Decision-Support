require 'active_record'
require 'application_helper'

namespace :predata do

  # rake predata:add_station RAILS_ENV=production
  # rake predata:add_station RAILS_ENV=development --trace
  desc "Add default station to database"
  task(:add_station => :environment) do
    puts(Station.build("Station 1", 13.890911516432162, 100.4473970800781))
    puts(Station.build("Station 2", 13.762895928509105, 100.61631187499998))
    puts(Station.build("Station 3", 13.850189124636994, 100.45553709082033))
  end
end