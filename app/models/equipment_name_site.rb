class EquipmentNameSite < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :equipment_name
  belongs_to :position
  
  column_model "equipment_name_id", :type => "int", :hidden => true
  column_model "position_id", :type => "int", :width => 300
  column_model "equipment_id", :type => "int", :width => 70
  column_model "score", :type => "int", :width => 70
  column_model "remark", :type => "string", :width => 70

  def self.build(equipment_id, equipment_name_id, position_id, score, remark)
    enp = EquipmentNameSite.find(:first,
      :conditions => ["position_id = ? and equipment_id = ? and equipment_name_id =?",
        position_id, equipment_id, equipment_name_id])
    unless enp
      enp = EquipmentNameSite.new()
    end
    enp.equipment_id = equipment_id
    enp.equipment_name_id = equipment_name_id
    enp.position_id = position_id
    enp.score = score
    enp.remark = remark

    if enp.save
      return "Save equipment name position #{enp.equipment_id}"
    else
      return "Can't equipment name position #{enp.equipment_id}"
    end
  end
  
  def self.find_by_params(params = {})
    conditions = {}
    if params[:sort]
      conditions[:order] = "#{params[:sort]} #{params[:dir]}"
    end
    results = find(:all, conditions)
    results_count = count(:all, conditions)
    return results, results_count
  end
  
  # api :selectsite
  # def select_site(params)
  #   # store selected boss id in the session for this widget's instance
  #   widget_session[:selected_site_id] = params[:site_id]
  # end  
end
