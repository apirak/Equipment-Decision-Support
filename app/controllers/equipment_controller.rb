class EquipmentController < ApplicationController
  def index
    #    @positions = Position.find(:all)
    @positions = Position.find_by_params(params)
    @total_count = Position.count(:all)

    respond_to do |format|
      format.html
      format.ext_json { render :json => @positions.to_ext_json(:root => "positions",
          :total_count => @total_count)}
    end
  end
end