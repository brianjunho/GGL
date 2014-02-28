class AddEditsToProofread1s < ActiveRecord::Migration
  def change
    add_column :proofread1s, :edit_id, :integer
  end
end
