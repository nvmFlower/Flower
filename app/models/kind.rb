class Kind < ApplicationRecord
  has_and_belongs_to_many :products
  validates :name, presence: true, uniqueness: true
  #has_many :type_product, through: :product_types, source: :product
end
