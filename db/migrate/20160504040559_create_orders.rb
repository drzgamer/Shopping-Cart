class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total
      t.datetime :datetime

      t.timestamps null: false
    end
  end
end
