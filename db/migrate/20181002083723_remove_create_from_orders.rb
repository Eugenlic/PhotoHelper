class RemoveCreateFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :image_url, :string
  end
end
