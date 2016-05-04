class CreateItemlists < ActiveRecord::Migration
  def change
    create_table :itemlists do |t|
      t.references :Orders
      t.references :Items
      
      t.integer :Quantity

      t.timestamps null: false
    end
  end
end
