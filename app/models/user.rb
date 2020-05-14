class User < ApplicationRecord
  validates_presence_of :username
  validates_presence_of :password_confirmation, on: :create
  has_secure_password
end
