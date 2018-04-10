class Bill < ApplicationRecord
  has_many :detail_bill, dependent: :destroy
  belongs_to :user

  validates :total_money, presence: true
  validates :date_order, presence: true
  validates :date_delivery, presence: true
  validates :status
end
