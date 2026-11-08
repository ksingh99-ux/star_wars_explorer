class PlanetsController < ApplicationController
  def index
    @planets = Planet.includes(:people).order(:name).page(params[:page]).per(10)
  end

  def show
    @planet = Planet.find(params[:id])
  end
end
