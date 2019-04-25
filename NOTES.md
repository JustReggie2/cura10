1. Integrate basic theme to asset pipeline
2. CRUD lists

I want people to be able to create top ten lists. They should be able to add items to those lists. The lists will have many categories. They should be able to navigate many lists and see each lists items. They will have a home of their lists and a feed of all users lists. Lists can be favorited and voted on to become top lists by popularity.

lists
  has many items

items
  belongs to a list
