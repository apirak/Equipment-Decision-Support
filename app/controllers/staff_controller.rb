class StaffController < ApplicationController
  def index
    @staffs = Staff.find(:all)

    respond_to do |format|
      format.html
      format.ext_json { render :json => @staffs.to_ext_json(:root => "staff",
          :total_count => @total_count)}
    end
  end

  def show
    @staffs = Staff.find(params[:id])
  end
end