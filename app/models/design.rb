class Design < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
