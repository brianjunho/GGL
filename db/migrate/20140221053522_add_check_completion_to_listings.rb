class AddCheckCompletionToListings < ActiveRecord::Migration
  def change
    add_column :listings, :check, :boolean
  end
end
