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
