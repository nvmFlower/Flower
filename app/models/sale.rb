class Sale < ApplicationRecord
  belongs_to :occasion
  validates :date_start, presence: true, uniqueness: true
  validates :date_end, presence: true, uniqueness: true
end
