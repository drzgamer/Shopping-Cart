class CreateItemlists < ActiveRecord::Migration
  def change
    drop_table :itemlists
    create_table :itemlists do |t|
      t.references :Order
      t.references :Item
      
      t.integer :Quantity

      t.timestamps null: false
    end
  end
end
