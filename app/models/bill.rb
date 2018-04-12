class Bill < ApplicationRecord
  has_many :detail_bills, dependent: :destroy
  belongs_to :user

  validates :total_money, presence: true
  validates :date_order, presence: true
  validates :date_delivery, presence: true
end
