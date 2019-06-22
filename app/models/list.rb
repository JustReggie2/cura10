class List < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :items
  has_many :favorite_lists
  has_many :favorited_by, through: :favorite_lists, source: :user
  has_many :votes, through: :favorite_lists, source: :user
  accepts_nested_attributes_for :items


  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
    self.category ? self.category.name : nil
  end


  def fav_count
    self.favorited_by.count
  end

  def vote_count
    self.votes.count
  end

  scope :has_votes, -> { joins(:favorite_lists).where('vote = ?', 1) }
  scope :most_votes, -> { has_votes.group(:list_id).order('count(list_id) DESC').limit(10) }

end
