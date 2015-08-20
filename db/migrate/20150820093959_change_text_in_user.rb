class ChangeTextInUser < ActiveRecord::Migration
  def up
  	change_column :articles, :text, :text, :limit => 250000
  end
  def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    change_column :articles, :text, :text, :limit => 200000
end
end
