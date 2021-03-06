class EquipmentController < ApplicationController

  def index
    @positions, @total_count = Position.find_by_params(params)
    #@positions, @total_count = Department.find_by_params(params)
    @equipments = Equipment.find(:all)
    @equipment_names = EquipmentName.find(:all)

    respond_to do |format|
      format.html
      format.ext_json { render :json => @positions.to_ext_json(:root => "positions",
          :total_count => @total_count)}
    end
  end
  
  def show
    @site_id = params[:id]
    @site = Site.find(@site_id)
  end
  
end