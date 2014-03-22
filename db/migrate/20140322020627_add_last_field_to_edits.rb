class AddLastFieldToEdits < ActiveRecord::Migration
  def change
    add_column :edits, :average_score, :decimal
  end
end
