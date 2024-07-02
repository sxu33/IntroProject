class Season < ApplicationRecord
    has_many :animes

     validates :name, presence: true
  validates :year, numericality: true
end
