class Account < ApplicationRecord
  belongs_to :user
  belongs_to :tags

  validates :user_id, presence: true
  validates :amount, presence: true
end
