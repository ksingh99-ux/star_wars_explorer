class StarshipsController < ApplicationController
  def index
    @starships = Starship.includes(:people).order(:name).page(params[:page]).per(10)
  end

  def show
    @starship = Starship.find(params[:id])
  end
end
