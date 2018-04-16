class Product < ApplicationRecord
  belongs_to :design
  has_many :product_colors, dependent: :destroy
  has_many :product_occasions, dependent: :destroy
  has_many :product_types, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :detail_bills, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :color_products, through: :product_colors, source: :color

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :img, presence: true
  validates :sale, presence: true
  validates :details, presence: true
  validates :view, presence: true
  validates :rating, presence: true
end
