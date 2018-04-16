class Occasion < ApplicationRecord
  has_many :product_occasions, dependent: :destroy
  has_one :sales, dependent: :destroy
  has_many :oc_products, through: :product_occasions, source: :product

  validates :name, presence: true, uniqueness: true
end
