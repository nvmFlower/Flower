class User < ApplicationRecord
  has_many :bills, dependent: :destroy
  has_many :rating, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  VALID_PHONE_REGEX = /^((\+841|01)[2689]|(\+849|09))[0-9]{8}$/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :address, presence: true
  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  validates :email, presence: true, length: {maximum: Settings.maximum_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :phone, presence: true, uniqueness: true,
    format: {with: VALID_PHONE_REGEX}
end
