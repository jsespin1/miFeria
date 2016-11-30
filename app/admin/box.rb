ActiveAdmin.register Box do
  #actions :create, :edit, :update, :add_item
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
    if action_name.to_s.eql? 'edit'
    	@box = Box.find(params[:id])
	    items_in_box = @box.order_items
	    @products_in_box = Array.new
	    items_in_box.each do |i|
	    	@products_in_box.push(i.product)
	    end
	    @availables = Array.new
	    all = Product.where(active: true)
	    all.each do |p|
	    	unless @products_in_box.include?(p)
			   @availables.push(p)
			end
	    end

	    panel 'Productos Incluidos', :class => "already_in_box" do
	      @products_in_box.each do |p|
	      	f.label p.name, :class=>"form-control remove-product-box", :'data-product-id'=>p.id.to_s,
	      	  				:id=>"product-" + p.id.to_s
	      end
	    end

	    panel 'Catálogo', :class => "not_in_box" do
	      @availables.each do |a|
	      	f.label a.name, :class=>"form-control add-product-box", :'data-product-id'=>a.id.to_s,
	      					:id=>"product-" + a.id.to_s
	      end
	    end
   	end
    actions
  end


  member_action :add_item do
  	#Se crea order_item en base al producto que se agrega y se incluye en Box
  	box = Box.find(params[:'id'])
	product = Product.find(params[:'product-id'])
	#Las OrderItems requieren referencia a la orden, en este caso se recurrirá a una orden auxiliar
	order_item = OrderItem.create! product: product, order: Order.first, quantity: 1
	box.order_items << order_item
	respond_to do |format|
      format.html {}
      format.json do 
        hash_product= {
          name: product.name,
          id: product.id,
        }
        render json: hash_product
      end
    end
  end

  member_action :remove_item do
  	box = Box.find(params[:'id'])
	product = Product.find(params[:'product-id'])
	order_item = nil
	box.order_items.each do |o|
		if o.product.id.to_i == product.id.to_i
			order_item = o
		end
	end
	box.order_items.delete(order_item)
	order_item.delete
	respond_to do |format|
      format.html {}
      format.json do 
        hash_product= {
          name: product.name,
          id: product.id,
        }
        render json: hash_product
      end
    end
  end

  member_action :edit_box_products do
    @box = Box.find(params[:'id'])
    @order_items = @box.order_items

    # This will render app/views/admin/posts/comments.html.erb
  end

  

end