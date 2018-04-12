class User < ApplicationRecord
  has_many :bills, dependent: :destroy
  has_many :rating, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.maximum_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :address, presence: true
  VALID_PHONE_REGEX = /^(01[2689]|09)[0-9]{8}$/
  validates :phone, presence: true, uniqueness: true,
    format: {with: VALID_PHONE_REGEX}
end
