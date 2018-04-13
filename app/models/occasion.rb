class Occasion < ApplicationRecord
  has_many :product_occasions, dependent: :destroy
  has_one :sale, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
