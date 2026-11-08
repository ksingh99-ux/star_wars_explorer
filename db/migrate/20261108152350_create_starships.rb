class CreateStarships < ActiveRecord::Migration[7.2]
  def change
    create_table :starships do |t|
      t.string :name
      t.string :model
      t.string :starship_class
      t.string :manufacturer
      t.string :cost_in_credits

      t.timestamps
    end
  end
end
