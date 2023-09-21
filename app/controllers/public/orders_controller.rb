class Public::OrdersController < ApplicationController
  # before_action :cartitem_nill,   only: [:new, :create]
  #   def cartitem_nill
  #   cart_items = current_end_user.cart_items
  #   if cart_items.blank?
  #     redirect_to cart_items_path
  #   end
  # end

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def create
    order = Order.new(order_params)
      order.save
      @cart_items = current_customer.cart_items.all

      @cart_items.each do |cart_item|
        @order_details = OrderDetail.new
        @order_details.order_id = order.id
        @order_details.item_id = cart_item.item.id
        @order_details.price = cart_item.price
        @order_details.number = cart_item.amount
        @order_details.making_status = 0
        @order_details.save!
      end
  end

    # CartItem.destroy_all
    # redirect_to orders_completed_path

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
    @orders = Order.all
  end

  def show
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :zip_code, :shipping_address, :shipping_name, :postage, :billing_amount, :customer_id , :status)
  end


end