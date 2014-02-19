class AddCommentsToEdits < ActiveRecord::Migration
  def change
    add_column :edits, :comments, :text
  end
end
