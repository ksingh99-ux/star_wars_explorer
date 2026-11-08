class Starship < ApplicationRecord
  has_many :starship_pilots, dependent: :destroy
  has_many :people, through: :starship_pilots

  validates :name, presence: true
  validates :model, presence: true
end
