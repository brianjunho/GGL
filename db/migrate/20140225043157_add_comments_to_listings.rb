class AddCommentsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :comments, :text
  end
end
