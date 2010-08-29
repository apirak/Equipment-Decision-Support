class DepartmentController < ApplicationController
  def index
    @departments = Department.find(:all)

    respond_to do |format|
      format.html
      format.ext_json { render :json => @positions.to_ext_json(:root => "department",
          :total_count => @total_count)}
    end
  end

  def show
    @department = Department.find(params[:id])
  end
end