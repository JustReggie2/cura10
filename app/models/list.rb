class List < ApplicationRecord
  belongs_to :category, optional: true
end
