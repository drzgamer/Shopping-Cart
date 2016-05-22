class AddUserToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :user, :belongs_to
  end
end
