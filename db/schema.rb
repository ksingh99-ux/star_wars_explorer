# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_11_08_152418) do
  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "height"
    t.string "mass"
    t.string "hair_color"
    t.string "eye_color"
    t.string "birth_year"
    t.string "gender"
    t.integer "planet_id", null: false
    t.integer "species_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planet_id"], name: "index_people_on_planet_id"
    t.index ["species_id"], name: "index_people_on_species_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "climate"
    t.string "terrain"
    t.string "population"
    t.string "diameter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "classification"
    t.string "designation"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "starship_pilots", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "starship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_starship_pilots_on_person_id"
    t.index ["starship_id"], name: "index_starship_pilots_on_starship_id"
  end

  create_table "starships", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "starship_class"
    t.string "manufacturer"
    t.string "cost_in_credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_pilots", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_vehicle_pilots_on_person_id"
    t.index ["vehicle_id"], name: "index_vehicle_pilots_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "vehicle_class"
    t.string "manufacturer"
    t.string "cost_in_credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "people", "planets"
  add_foreign_key "people", "species"
  add_foreign_key "starship_pilots", "people"
  add_foreign_key "starship_pilots", "starships"
  add_foreign_key "vehicle_pilots", "people"
  add_foreign_key "vehicle_pilots", "vehicles"
end
