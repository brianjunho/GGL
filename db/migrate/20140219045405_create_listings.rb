class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :prompt
      t.text :application
      t.string :option

      t.timestamps
    end
  end
end
