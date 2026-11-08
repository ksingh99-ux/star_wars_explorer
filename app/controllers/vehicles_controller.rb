class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.includes(:people).order(:name).page(params[:page]).per(10)
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end
end
