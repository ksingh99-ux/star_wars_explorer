class CreatePlanets < ActiveRecord::Migration[7.2]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :climate
      t.string :terrain
      t.string :population
      t.string :diameter

      t.timestamps
    end
  end
end
