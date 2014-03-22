class RemoveFieldsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :forem_admin, :boolean
    remove_column :users, :forem_state, :string
    remove_column :users, :forem_auto_subscribe, :boolean
  end
end
