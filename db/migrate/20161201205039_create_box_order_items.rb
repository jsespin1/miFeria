class CreateBoxOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :box_order_items, id: false do |t|
      t.references :box
      t.references :order_item
      t.timestamps
    end
  end
end
