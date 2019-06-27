class List < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :items, before_add: :validate_item_limit
  has_many :favorite_lists
  has_many :favorited_by, through: :favorite_lists, source: :user
  has_many :votes, through: :favorite_lists, source: :user
  validates :name, presence: true
  NUMBER_OF_PERMITTED_ITEMS = 10
  accepts_nested_attributes_for :items
  scope :has_votes, -> { joins(:favorite_lists).where('vote = ?', 1) }
  scope :most_votes, -> { has_votes.group(:list_id).order('count(list_id) DESC').limit(10) }

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

  private

  def validate_item_limit(item)
    raise Exception.new if items.size >= NUMBER_OF_PERMITTED_ITEMS
  end

end
