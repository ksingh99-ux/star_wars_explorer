# Star Wars Explorer

A Ruby on Rails app that imports data from the Star Wars API (SWAPI) and lets you
browse and search characters, planets, species, starships and vehicles.

## Setup

    bundle install
    bin/rails db:migrate
    bin/rails db:seed
    bin/rails server

Then open http://localhost:3000

## Features

- Paginated lists of people, planets, species, starships and vehicles
- Detail pages that link between related records
- Search people by name and filter by homeworld

## Data

See DATA_SOURCES.md for the dataset description.
The database diagram (ERD) is in app/assets/images/erd.png.
