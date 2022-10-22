class Account < ApplicationRecord
  belongs_to :user
  validates :user_id, :email, presence: true
  store_accessor :tokens, :access_token, :refresh_token
end
