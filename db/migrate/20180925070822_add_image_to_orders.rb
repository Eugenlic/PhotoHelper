class AddImageToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :image, :string
  end
end
