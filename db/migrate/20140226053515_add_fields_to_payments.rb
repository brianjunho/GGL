class AddFieldsToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :proofreader_id, :integer
  end
end
