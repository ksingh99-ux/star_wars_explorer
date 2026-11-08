class Planet < ApplicationRecord
  has_many :people, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :climate, presence: true
end
