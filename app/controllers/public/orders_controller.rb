class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :is_matching_login_customer, only: [:show]
  # before_action :cartitem_nill,   only: [:new, :create]
  #   def cartitem_nill
  #   cart_items = current_end_user.cart_items
  #   if cart_items.blank?
  #     redirect_to cart_items_path
  #   end
  # end

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def create
    order = Order.new(order_params)
      order.save!
      @cart_items = current_customer.cart_items.all

      @cart_items.each do |cart_item|
        @order_details = OrderDetail.new
        @order_details.order_id = order.id
        @order_details.item_id = cart_item.item.id
        @order_details.unit_price = cart_item.item.add_tax_price
        @order_details.amount = cart_item.amount
        # @order_details.making_status = 0
        @order_details.save!
      end
     CartItem.destroy_all
     redirect_to orders_thanx_path
  end

    # CartItem.destroy_all
    # redirect_to orders_completed_path

  def confirm
     @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.zip_code = current_customer.zip_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.zip_code = @address.zip_code
       @order.shipping_address = @address.shipping_address
       @order.shipping_name = @address.shipping_name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    else
      @addresses = Address.all
      flash[:notice] = "住所を選択してください"
      render 'new'
    end

      @cart_items = current_customer.cart_items
      @order_new = Order.new

      # render :confirm
  end

  def thanx
  end

  def index
    @orders = current_customer.orders.all
    # @orders = Order.all
    @ordered_items = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @ordered_items = @order.order_details.all
    @total_amount = 0

  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :zip_code, :shipping_address, :shipping_name, :postage, :billing_amount, :customer_id , :status)
  end

  def is_matching_login_customer
    order = Order.find(params[:id])
    unless order.customer.id == current_customer.id
      redirect_to root_path
    end
  end
  #   def is_matching_login_user
  #   user = User.find(params[:id])
  #   unless user.id == current_user.id
  #     redirect_to post_images_path
  #   end
  # end
end