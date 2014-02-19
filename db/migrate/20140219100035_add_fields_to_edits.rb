class AddFieldsToEdits < ActiveRecord::Migration
  def change
    add_column :edits, :requester_id, :integer
    add_column :edits, :editor_id, :integer
  end
end
