class User < ApplicationRecord
  has_many :accounts, dependent: :destroy
  validates :email, presence: true, uniqueness: true
end
