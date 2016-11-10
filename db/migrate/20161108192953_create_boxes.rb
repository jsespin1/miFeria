class CreateBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes do |t|
      t.string :name
      t.string :type
      t.decimal :price, precision: 12, scale: 3
      t.decimal :wight, precision: 12, scale: 3
      t.boolean :active

      t.timestamps
    end
  end
end
