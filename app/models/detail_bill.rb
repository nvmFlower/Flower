class DetailBill < ApplicationRecord
  belongs_to :bill
  belongs_to :product

  validates :amout, presence: true
  validates :price, presence: true
end
