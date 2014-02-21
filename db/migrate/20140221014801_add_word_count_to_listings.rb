class AddWordCountToListings < ActiveRecord::Migration
  def change
    add_column :listings, :word_count, :integer
  end
end
