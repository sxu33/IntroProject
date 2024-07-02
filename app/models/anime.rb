class Anime < ApplicationRecord
  belongs_to :type
  belongs_to :season
  has_many :heats

  validates :title, presence: true
end
