class List < ApplicationRecord
  belongs_to :category, optional: true
  has_many :items
  accepts_nested_attributes_for :items 

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
    self.category ? self.category.name : nil
  end
end
