class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :text
      t.string :image
      t.integer :category_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
