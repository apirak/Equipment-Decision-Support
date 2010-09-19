class Position < ActiveRecord::Base
  has_many   :equipment_name_sites  
#  act_as_ext_column_model
  
  column_model "id", :type => "int", :hidden => true
  column_model "description", :type => "string", :width => 400
  column_model "name", :type => "string", :width => 300
  column_model "icon", :type => "string", :width => 70
  column_model "type", :type => "string", :width => 70
  column_model "lat", :type => "float", :width => 90
  column_model "lng", :type => "float", :width => 90

  def self.find_by_params(params = {})
    conditions = {}
    if params[:sort]
      conditions[:order] = "#{params[:sort]} #{params[:dir]}"
    end
    positions = find(:all, conditions)
    positions_count = count(:all)#, conditions)
    return positions, positions_count
  end
end