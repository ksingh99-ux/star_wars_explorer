class SearchController < ApplicationController
  def index
    @query = params[:q].to_s.strip
    @planet_id = params[:planet_id]
    @species_id = params[:species_id]

    @people = Person.includes(:planet, :species).order(:name)
    @people = @people.where("people.name LIKE ?", "%#{Person.sanitize_sql_like(@query)}%") if @query.present?
    @people = @people.where(planet_id: @planet_id) if @planet_id.present?
    @people = @people.where(species_id: @species_id) if @species_id.present?
    @people = @people.page(params[:page]).per(10)
  end
end
