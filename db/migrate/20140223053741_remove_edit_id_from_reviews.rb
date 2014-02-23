class RemoveEditIdFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :edit_id, :integer
  end
end
