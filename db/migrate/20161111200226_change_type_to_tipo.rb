class ChangeTypeToTipo < ActiveRecord::Migration[5.0]
  def change
  	rename_column :boxes, :type, :tipo
  end
end
