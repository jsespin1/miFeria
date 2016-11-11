ActiveAdmin.register Product do
  permit_params :name, :price, :unit, :active


  index :as => :table do
    column :name
    column :price
    column :unit
    column :active
    actions

  end



end