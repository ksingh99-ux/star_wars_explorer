class StarshipPilot < ApplicationRecord
  belongs_to :person
  belongs_to :starship

  validates :person_id, presence: true
  validates :starship_id, uniqueness: { scope: :person_id }
end
