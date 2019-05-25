class User < ApplicationRecord
  has_many :lists
  has_many :favorite_lists
  has_many :favorites, through: :favorite_lists, source: :list
  has_secure_password

  def favorited!(list)
    self.favorites << list
  end

  def unfavorited!(list)
    self.favorites.delete(list)
  end

  def favorited?(list)
    self.favorites.find_by(id: list.id).present?
  end
end
