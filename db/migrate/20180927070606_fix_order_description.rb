class FixOrderDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :description, :description
    change_column :orders, :description, :text, limit: 350
  end
end
