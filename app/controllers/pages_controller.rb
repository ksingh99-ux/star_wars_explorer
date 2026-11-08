class PagesController < ApplicationController
  def home
    @sections = [
      ["People",    Person.count,   people_path],
      ["Planets",   Planet.count,   planets_path],
      ["Species",   Species.count,  species_index_path],
      ["Starships", Starship.count, starships_path],
      ["Vehicles",  Vehicle.count,  vehicles_path]
    ]
  end

  def about
  end
end
