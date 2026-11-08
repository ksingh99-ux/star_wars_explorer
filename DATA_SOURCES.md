# Data Sources (Feature 1.1)

My project uses the Star Wars API (SWAPI) at https://swapi.dev, a free JSON API
that needs no API key. I use five endpoints: people, planets, species,
starships and vehicles. (Film data is not used.)

## Structure
- People: name, height, mass, hair colour, eye colour, birth year, gender
- Planets: name, climate, terrain, population, diameter
- Species: name, classification, designation, language
- Starships: name, model, starship class, manufacturer, cost
- Vehicles: name, model, vehicle class, manufacturer, cost

## How the data is related
- Each person has one homeworld (planet). A planet has many people. (one-to-many)
- A person can belong to a species. A species has many people. (one-to-many)
  Some people have no species listed, so this link is optional.
- A person can pilot many starships; a starship can have many pilots.
  (many-to-many, join table: starship_pilots)
- A person can pilot many vehicles; a vehicle can have many pilots.
  (many-to-many, join table: vehicle_pilots)

## Tables
planets, species, people, starships, vehicles, starship_pilots, vehicle_pilots

## Integration
The API links records with URLs (e.g. "homeworld": ".../planets/1/").
My seed script uses these URLs to find the matching records in my database,
then creates the relationships using Active Record's own IDs.
