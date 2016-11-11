class ChangeWightToWeight < ActiveRecord::Migration[5.0]
  def change
  	rename_column :boxes, :wight, :weight
  end
end
