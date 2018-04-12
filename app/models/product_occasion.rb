class ProductOccasion < ApplicationRecord
  belongs_to :occasion
  belongs_to :product
end
