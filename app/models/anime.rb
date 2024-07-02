class Anime < ApplicationRecord
  belongs_to :type
  belongs_to :season
  has_many :heats
end
