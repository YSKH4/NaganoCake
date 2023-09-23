class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.where(customer_id: current_customer)
    # 空の配列を用意する
    @total_amount = [0]
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer = current_customer
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_item = CartItem.where(customer_id: current_customer)
    @cart_item.destroy_all
    redirect_to cart_items_path
  end

  # def is_matching_login_customer
  #   current_customer = Customer.find(params[:id])
  #   unless customer.id == current_customer.id
  #     redirect_to  customer_session_path
  #   end
  # end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end