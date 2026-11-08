class SpeciesController < ApplicationController
  def index
    @species_list = Species.includes(:people).order(:name).page(params[:page]).per(10)
  end

  def show
    @species = Species.find(params[:id])
  end
end
