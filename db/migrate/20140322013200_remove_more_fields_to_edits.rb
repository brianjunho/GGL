class RemoveMoreFieldsToEdits < ActiveRecord::Migration
  def change
    remove_column :edits, :one_score, :integer
    remove_column :edits, :two_score, :integer
    remove_column :edits, :three_score, :integer
    remove_column :edits, :four_score, :integer
  end
end
