class Bill < ApplicationRecord
  has_many :detail_bills, dependent: :destroy
  belongs_to :user

  validates :total_money, presence: true
  validates :date_order, presence: true
  validates :date_delivery, presence: true
  before_save :update_subtotal

  def subtotal
    detail_bills.collect { |oi|
      oi.valid? ? (oi.count * oi.price) : 0}.sum
  end

  private
  def update_subtotal
    self[:subtotal] = subtotal
  end
end
