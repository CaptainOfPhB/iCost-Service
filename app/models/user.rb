class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }, format: { with: ConstantData::VALID_EMAIL_REGEX }, if: :create
end
