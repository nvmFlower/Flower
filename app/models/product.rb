class Product < ApplicationRecord
  belongs_to :design
  has_many :product_colors, dependent: :destroy
  has_many :product_occasions, dependent: :destroy
  has_many :product_types, dependent: :destroy
  has_many :rating, dependent: :destroy
  has_many :detail_bill, dependent: :destroy
  has_many :comment, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :img, presence: true
  validates :sale, presence: true
  validates :details, presence: true
  validates :view, presence: true
  validates :rating, presence: true
end
