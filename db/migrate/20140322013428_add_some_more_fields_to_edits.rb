class AddSomeMoreFieldsToEdits < ActiveRecord::Migration
  def change
    add_column :edits, :one_score, :string
    add_column :edits, :two_score, :string
    add_column :edits, :three_score, :string
    add_column :edits, :four_score, :string
  end
end
