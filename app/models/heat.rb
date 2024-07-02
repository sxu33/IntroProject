class Heat < ApplicationRecord
  belongs_to :anime

  validates :value, presence: true, numericality: { only_integer: true }
end
