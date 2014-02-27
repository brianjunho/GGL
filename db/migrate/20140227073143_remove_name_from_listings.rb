class RemoveNameFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :name, :string
  end
end
