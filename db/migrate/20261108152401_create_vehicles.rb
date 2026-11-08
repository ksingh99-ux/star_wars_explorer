class CreateVehicles < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :model
      t.string :vehicle_class
      t.string :manufacturer
      t.string :cost_in_credits

      t.timestamps
    end
  end
end
