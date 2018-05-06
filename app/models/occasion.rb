class Occasion < ApplicationRecord
  has_and_belongs_to_many :products
  has_one :sales, dependent: :destroy
  #has_many :oc_products, through: :product_occasions, source: :product

  validates :name, presence: true, uniqueness: true
end
