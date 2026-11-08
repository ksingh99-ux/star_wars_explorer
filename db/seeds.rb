require "net/http"
require "json"

BASE_URL = "https://swapi.dev/api"

# Downloads every page of an endpoint (the API returns 10 records per page)
def fetch_all(resource)
  results = []
  url = "#{BASE_URL}/#{resource}/"

  while url
    puts "Fetching #{url}"
    data = JSON.parse(Net::HTTP.get(URI(url)))
    results.concat(data["results"])
    url = data["next"] # nil when there are no more pages
  end

  results
end

# Prints why a record didn't save (useful for debugging)
def report(record)
  puts "  Could not save #{record.class}: #{record.errors.full_messages.join(', ')}" unless record.persisted?
end

puts "Clearing old data..."
VehiclePilot.delete_all
StarshipPilot.delete_all
Person.delete_all
Vehicle.delete_all
Starship.delete_all
Species.delete_all
Planet.delete_all

# --- Source 1: planets ---
planets_by_url = {}
fetch_all("planets").each do |data|
  planet = Planet.create(
    name: data["name"], climate: data["climate"], terrain: data["terrain"],
    population: data["population"], diameter: data["diameter"]
  )
  report(planet)
  planets_by_url[data["url"]] = planet if planet.persisted?
end

# --- Source 2: species ---
species_by_url = {}
fetch_all("species").each do |data|
  species = Species.create(
    name: data["name"], classification: data["classification"],
    designation: data["designation"], language: data["language"]
  )
  report(species)
  species_by_url[data["url"]] = species if species.persisted?
end

# --- Source 3: people (linked to planets and species) ---
people_by_url = {}
fetch_all("people").each do |data|
  person = Person.create(
    name: data["name"], height: data["height"], mass: data["mass"],
    hair_color: data["hair_color"], eye_color: data["eye_color"],
    birth_year: data["birth_year"], gender: data["gender"],
    planet: planets_by_url[data["homeworld"]],
    species: species_by_url[data["species"].first] # may be nil, that's allowed
  )
  report(person)
  people_by_url[data["url"]] = person if person.persisted?
end

# --- Source 4: starships (+ pilots join table) ---
fetch_all("starships").each do |data|
  starship = Starship.create(
    name: data["name"], model: data["model"], starship_class: data["starship_class"],
    manufacturer: data["manufacturer"], cost_in_credits: data["cost_in_credits"]
  )
  report(starship)
  next unless starship.persisted?

  data["pilots"].each do |pilot_url|
    person = people_by_url[pilot_url]
    report(StarshipPilot.create(person: person, starship: starship)) if person
  end
end

# --- Source 5: vehicles (+ pilots join table) ---
fetch_all("vehicles").each do |data|
  vehicle = Vehicle.create(
    name: data["name"], model: data["model"], vehicle_class: data["vehicle_class"],
    manufacturer: data["manufacturer"], cost_in_credits: data["cost_in_credits"]
  )
  report(vehicle)
  next unless vehicle.persisted?

  data["pilots"].each do |pilot_url|
    person = people_by_url[pilot_url]
    report(VehiclePilot.create(person: person, vehicle: vehicle)) if person
  end
end

puts
puts "Planets:         #{Planet.count}"
puts "Species:         #{Species.count}"
puts "People:          #{Person.count}"
puts "Starships:       #{Starship.count}"
puts "Vehicles:        #{Vehicle.count}"
puts "Starship pilots: #{StarshipPilot.count}"
puts "Vehicle pilots:  #{VehiclePilot.count}"
total = Planet.count + Species.count + Person.count + Starship.count +
        Vehicle.count + StarshipPilot.count + VehiclePilot.count
puts "TOTAL ROWS:      #{total}"
