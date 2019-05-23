class List < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :items
  has_many :favorite_lists
  has_many :favorited_by, through: :favorite_lists, source: :user
  accepts_nested_attributes_for :items
  # def item_desc_links=(items)
  #   items.each do |desc_link|
  #     item = self.items.build(desc_link: desc_link) unless desc_link.empty?
  #   end
  # end
  #
  # def item_desc_links
  #   self.items.collect(&:desc_link)
  # end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
    self.category ? self.category.name : nil
  end
end
