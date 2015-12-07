class OrderItemsController < ApplicationController
  def create
  	@order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order_item = OrderItem.find(params[:id])
    respond_to do |format|
      if @order_item.update_attributes(order_item_params)
        format.html { redirect_to(@order_item, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@order_item) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@order_item) }
      end
    end
  end

  def destroy
  	@order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :unit_price)
  end
  
end
