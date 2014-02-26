class AddRequestAmountToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :request, :decimal
  end
end
