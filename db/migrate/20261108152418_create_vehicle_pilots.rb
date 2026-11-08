class CreateVehiclePilots < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicle_pilots do |t|
      t.references :person, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
