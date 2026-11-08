class VehiclePilot < ApplicationRecord
  belongs_to :person
  belongs_to :vehicle

  validates :person_id, presence: true
  validates :vehicle_id, uniqueness: { scope: :person_id }
end
