class Item < ApplicationRecord
  belongs_to :list
  validates :desc_link, presence: true
end
