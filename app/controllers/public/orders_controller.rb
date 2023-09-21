class Public::OrdersController < ApplicationController
  def new
    @order = Oder.new
    @addresses = Address.all
  end
  
  def confirm
     @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.zip_code = current_customer.zip_code
      @order.shipping_address = current_customer.shipping_address
      @order.shipping_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.zip_code = @address.zip_code
       @order.shipping_address = @address.shipping_address
       @order.shipping_name = @address.shipping_name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
      @cart_items = current_customer.cart_items
      @order_new = Order.new
      render :confirm
  end

  def thanx
  end

  def index
  end

  def show
  end
end
