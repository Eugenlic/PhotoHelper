class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.text :discription
      t.string :image_url

      t.timestamps
    end
  end
end
