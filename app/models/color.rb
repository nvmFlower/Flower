class Color < ApplicationRecord
  has_and_belongs_to_many :products
  validates :name, presence: true, uniqueness: true

  def name_with_initial
    "#{first_name.first}. #{id}"
  end
end
