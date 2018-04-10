class Rating < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :star_number, presence: true
end
