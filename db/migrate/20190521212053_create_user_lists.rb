class CreateUserLists < ActiveRecord::Migration[5.2]
  def change
    create_table :user_lists do |t|
      t.integer :user_id
      t.integer :list_id
      t.integer :vote

      t.timestamps
    end
  end
end
