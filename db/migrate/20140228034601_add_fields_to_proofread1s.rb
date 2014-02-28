class AddFieldsToProofread1s < ActiveRecord::Migration
  def change
    add_column :proofread1s, :editor_id, :integer
  end
end
