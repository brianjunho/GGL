class AddFieldsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :reviewee_id, :integer
    add_column :reviews, :reviewer_id, :integer
  end
end
