class CreateBoxesOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes_order_items do |t|
      #t.references :box_id, foreign_key: true
      #t.references :order_item_id, foreign_key: true
      t.integer :box_id, foreign_key: true
      t.integer :order_item_id, foreign_key: true
    end
  end
end
