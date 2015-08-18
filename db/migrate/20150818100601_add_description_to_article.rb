class AddDescriptionToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :description, :string
    add_column :articles, :keywords, :string
  end
end
