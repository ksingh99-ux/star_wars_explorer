class PagesController < ApplicationController
  def home
    @counts = {
      "People"    => Person.count,
      "Planets"   => Planet.count,
      "Species"   => Species.count,
      "Starships" => Starship.count,
      "Vehicles"  => Vehicle.count
    }
  end

  def about
  end
end
