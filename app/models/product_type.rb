class ProductType < ApplicationRecord
  belongs_to :type
  belongs_to :product
end
