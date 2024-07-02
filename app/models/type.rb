class Type < ApplicationRecord
     has_many :animes

      validates :name, presence: true, length: { in: 3..50 }
end
