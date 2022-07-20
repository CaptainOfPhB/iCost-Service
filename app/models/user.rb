class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
