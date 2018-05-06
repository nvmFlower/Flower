class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user

  validates :total_money, presence: true
  validates :date_order, presence: true
  validates :date_delivery, presence: true
  before_save :update_subtotal

  def subtotal
    line_items.collect { |oi|
      oi.valid? ? (oi.count * oi.price) : 0}.sum
  end

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
      if current_item
        current_item.quantity += 1
      else
        current_item = line_items.build(product_id: product.id)
      end
    current_item
  end
  private
  def update_subtotal
    self[:subtotal] = subtotal
  end
end
