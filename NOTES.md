1. Integrate basic theme to asset pipeline
2. CRUD lists

I want people to be able to create top ten lists. They should be able to add items to those lists. The lists will have many categories. They should be able to navigate many lists and see each lists items. They will have a home of their lists and a feed of all users lists. Lists can be favorited and voted on to become top lists by popularity.

lists
  has many items

items
  belongs to a list


Lists
  Name
  category

items
  desc_link
  list_id

3. add login with sessions controller   

4. create helper to decide link render (i.e. image, video, mp3, website)
  - will iterate over desc_link
  if image(.jpg, .png) render image
  elsif song(.mp3) render player
  ... maybe use case/when

5. top list section  

5. errors and flash messages
  - no lists made... you have no lists

#remember
  - figure out how to up vote and favorite list


  # def self.most_votes
  #   where("vote >= 2")
  # end

  scope vote_count, -> {where(vote: 1)}.count

  # scope :most_votes, -> {where(list_id: self.maximum(:vote))}
  # scope :count_votes, group(:list_id).select("list_id, count(*) as total_votes").where(vote: 1)
  # scope :most_votes, count_votes.order("total_votes DESC").limit(1)
  # scope :most_votes, -> {where(vote: 1).select("list_id, count(*) as countof_votes")}
  # scope :highest_votes, most_votes.order("countof_votes DESC").limit(1)
  # scope :count_votes, -> {where(vote: 1)}
  # scope :count_of_votes, group(:list_id).where(vote: 1)

  # scope :most_votes, -> { has_votes.order('list_id DESC').group(:list_id).count }
  # def self.count_votes
  #   joins(:favorite_lists).group(:list_id).select("vote, count(*) as total_votes")
  # end
  # def self.most_votes
  #   where("vote >= 2")
  # end

  # scope :most_votes, -> {where(list_id: self.maximum(:vote))}
  # I want to figure out the list_id that has the largest vote count...
