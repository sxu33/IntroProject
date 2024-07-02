class Anime < ApplicationRecord
  belongs_to :type
  belongs_to :season
  has_one :heat

  validates :title, presence: true
end
