class DropBoxesOrderItems < ActiveRecord::Migration[5.0]
  def up
    drop_table :boxes_order_items
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end


class CreateBoxesOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes_order_items, id: false do |t|
      #t.references :box_id, foreign_key: true
      #t.references :order_item_id, foreign_key: true
      t.integer :box_id, foreign_key: true
      t.integer :order_item_id, foreign_key: true
    end
  end
end
