class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :desc_link
      t.integer :list_id

      t.timestamps
    end
  end
end
