class Color < ApplicationRecord
  has_many :product_colors, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def name_with_initial
    "#{first_name.first}. #{id}"
  end
end
