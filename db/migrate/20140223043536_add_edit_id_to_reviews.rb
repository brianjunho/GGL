class AddEditIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :edit_id, :integer
  end
end
