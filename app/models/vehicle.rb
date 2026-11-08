class Vehicle < ApplicationRecord
  has_many :vehicle_pilots, dependent: :destroy
  has_many :people, through: :vehicle_pilots

  validates :name, presence: true
  validates :model, presence: true
end
