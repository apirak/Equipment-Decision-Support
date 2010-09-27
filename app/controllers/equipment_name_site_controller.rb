class EquipmentNameSiteController < ApplicationController

  def index
    @equipment_name_sites, @total_count = EquipmentNameSite.find_by_params(params)

    respond_to do |format|
      format.html
      format.ext_json { render :json => @equipment_name_sites.to_ext_json(:root => "positions",
          :total_count => @total_count)}
    end
  end
  

end