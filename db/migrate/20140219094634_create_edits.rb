class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.text :proofread

      t.timestamps
    end
  end
end
