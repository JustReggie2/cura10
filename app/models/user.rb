class User < ApplicationRecord
  has_many :lists
  has_many :favorite_lists
  has_many :favorites, through: :favorite_lists, source: :list
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
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
