class Sale < ApplicationRecord
  belongs_to :occasion
  validates :date_start, presence: true
  validates :date_end, presence: true
end
