class Order < ApplicationRecord
  attr_accessor :date_order
  has_many :order_items
  belongs_to :user

  validates :total, presence: true, numericality: { greater_than: 0 }
  validates :address, presence: true
  validates :date_order, presence: true
  validates :date_delivery, presence: true
end
