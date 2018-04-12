class TypeFlower < ApplicationRecord
  has_many :product_types, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
