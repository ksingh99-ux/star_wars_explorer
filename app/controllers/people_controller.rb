class PeopleController < ApplicationController
  def index
    @people = Person.includes(:planet, :species).order(:name).page(params[:page]).per(10)
  end

  def show
    @person = Person.find(params[:id])
  end
end
