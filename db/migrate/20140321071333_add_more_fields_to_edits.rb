class AddMoreFieldsToEdits < ActiveRecord::Migration
  def change
    add_column :edits, :word_count, :integer
    add_column :edits, :one_score, :integer
    add_column :edits, :one_reason, :text
    add_column :edits, :one_suggestion, :text
    add_column :edits, :two_score, :integer
    add_column :edits, :two_reason, :text
    add_column :edits, :two_suggestion, :text
    add_column :edits, :three_score, :integer
    add_column :edits, :three_reason, :text
    add_column :edits, :three_suggestion, :text
    add_column :edits, :four_score, :integer
    add_column :edits, :four_reason, :text
    add_column :edits, :four_suggestion, :text
  end
end
