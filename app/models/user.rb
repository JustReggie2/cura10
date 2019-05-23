class User < ApplicationRecord
  has_many :lists
  has_many :favorite_lists
  has_many :favorites, through: :favorite_lists, source: :list
  has_secure_password
end
