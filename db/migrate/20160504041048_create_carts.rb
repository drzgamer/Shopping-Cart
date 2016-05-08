class CreateCarts < ActiveRecord::Migration

  def change
    create_table :carts do |t|
      t.references :User
      t.references :Item

      t.timestamps null: false
    end
  end
end
