class Season < ApplicationRecord
    has_many :animes

     validates :name, presence: true
end
