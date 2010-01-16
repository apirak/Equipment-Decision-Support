class EquipmentController < ApplicationController
  def index
    @positions = Position.find(:all)
    @total_count = 2 #Position.count(:all)
  end
end