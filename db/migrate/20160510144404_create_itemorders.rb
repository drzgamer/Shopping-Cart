class CreateItemorders < ActiveRecord::Migration
  def change
    create_table :itemorders do |t|
      t.belongs_to :item, index: true, foreign_key: true
      t.belongs_to :order, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
