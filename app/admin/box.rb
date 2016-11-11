ActiveAdmin.register Box do
  permit_params :name, :tipo, :price, :weight, :active

  index :as => :table do
    column :name
    column :tipo
    column :price
    column :active

    actions

  end

  form do |f|
    inputs 'Details' do
      input :name, label: "Nombre"
      input :tipo, label: "Tipo de Alimento"
      input :price, label: "Precio [$]"
      input :weight, label: "Peso [Kg]"
      input :active
    end
    #Se inicializan variables de productos en caja y para agregar a caja
    @box = Box.find(params[:id])
    items_in_box = @box.order_items
    @products_in_box = Array.new
    items_in_box.each do |i|
    	@products_in_box.push(i.product.name)
    end
    @availables = Product.where.not(name: @products_in_box)

    panel 'Productos Incluidos' do
      @products_in_box.each do |p|
      	f.label p.name, :class=>"form-control", :id=>"name_id"
      end
    end

    panel 'Catálogo' do
      @availables.each do |a|
      	f.label a.name, :class=>"form-control", :id=>"name_id"
      end
    end

    actions

  end



  

end