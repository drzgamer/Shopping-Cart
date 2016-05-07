class CreateOrderlists < ActiveRecord::Migration
  def change
    create_table :orderlists do |t|
      t.references :User
      t.references :Orders

      t.timestamps null: false
    end
  end
end
