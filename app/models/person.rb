class Person < ApplicationRecord
  belongs_to :planet
  belongs_to :species, optional: true

  has_many :starship_pilots, dependent: :destroy
  has_many :starships, through: :starship_pilots

  has_many :vehicle_pilots, dependent: :destroy
  has_many :vehicles, through: :vehicle_pilots

  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true
end
