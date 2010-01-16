class Position < ActiveRecord::Base
  include ColumnModelBuilder
  
  column_model "id", :type => "int", :hidden => true
  column_model "description", :type => "string", :width => 300
  column_model "icon", :type => "string", :width => 70
  column_model "type", :type => "string", :width => 70
  column_model "lat", :type => "float", :width => 70
  column_model "lng", :type => "float", :width => 70
  
end