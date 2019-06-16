class FavoriteList < ApplicationRecord
  belongs_to :user
  belongs_to :list
  # scope :most_votes, -> {where(list_id: self.maximum(:vote))}
  # scope :count_votes, group(:list_id).select("list_id, count(*) as total_votes").where(vote: 1)
  # scope :most_votes, count_votes.order("total_votes DESC").limit(1)
  # scope :most_votes, -> {where(vote: 1).select("list_id, count(*) as countof_votes")}
  # scope :highest_votes, most_votes.order("countof_votes DESC").limit(1)
  # scope :count_votes, -> {where(vote: 1)}
  # scope :count_of_votes, group(:list_id).where(vote: 1)


end
