class User < ApplicationRecord
  has_many :lists
  has_many :favorite_lists
  has_many :favorites, through: :favorite_lists, source: :list
  # has_many :voted_for, through: :favorite_lists, source: :list
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "is invalid" }
  validates :password, presence: true, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).{6,}\z/, message: "must be at least 6 characters and include one number & one letter"}
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

  # def up_vote(list)
  #   list.votes = list.votes +1
  # end
end
