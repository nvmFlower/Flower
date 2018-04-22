class Product < ApplicationRecord

  mount_uploader :img, PictureUploader
  has_and_belongs_to_many :colors
  has_and_belongs_to_many :occasions
  has_and_belongs_to_many :kinds

  has_many :ratings, dependent: :destroy

  has_many :order_items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :color_products, through: :product_colors, source: :color

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :img, presence: true
  validates :sale, presence: true
  validates :details, presence: true
  validates :view, presence: true
  validates :design_id, presence: true

  def picture_size
    if img.size > 5.megabytes
      errors.add(:img, "Anh phai nho hon 5MB")
    end
  end
 def self.search search, id
    if search
      where(["name LIKE ?", "%#{search}"])
    else
      scope
    end
  end
  private

  def self.number_view id
    find_by(id: id).view
  end

end
