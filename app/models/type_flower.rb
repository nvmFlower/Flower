class TypeFlower < ApplicationRecord
  has_many :product_types, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  has_many :type_product, through: :product_types, source: :product
end
