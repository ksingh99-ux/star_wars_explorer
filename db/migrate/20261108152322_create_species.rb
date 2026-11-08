class CreateSpecies < ActiveRecord::Migration[7.2]
  def change
    create_table :species do |t|
      t.string :name
      t.string :classification
      t.string :designation
      t.string :language

      t.timestamps
    end
  end
end
