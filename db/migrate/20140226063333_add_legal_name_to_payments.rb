class AddLegalNameToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :legalname, :string
  end
end
