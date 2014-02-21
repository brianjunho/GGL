class RemoveCheckFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :check, :boolean
  end
end
