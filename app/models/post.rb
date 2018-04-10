class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :img, presence: true
end
