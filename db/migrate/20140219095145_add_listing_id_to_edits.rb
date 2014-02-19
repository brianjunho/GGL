class AddListingIdToEdits < ActiveRecord::Migration
  def change
    add_column :edits, :listing_id, :integer
  end
end
