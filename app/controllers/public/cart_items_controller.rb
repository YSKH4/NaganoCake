class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.where(customer_id: current_customer)
    # 空の配列を用意する
    @total_amount = [0]
  end

# 　def create
#       @cart_item = CartItem.new(params_cart_item)
#       @cart_item.customer_id=current_customer.id
#       @cart_items=current_customer.cart_items.all
#       @cart_items.each do |cart_item|
#       if cart_item.item_id==@cart_item.item_id
#         new_quantity = cart_item.quantity + @cart_item.quantity
#         cart_item.update_attribute(:quantity, new_quantity)
#         @cart_item.delete
#       end
#     @cart_item.save
#     redirect_to cart_items_path,notice:"カートに商品が入りました"
#   end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if
      redirect_to items_path
    else
      @cart_item.customer = current_customer
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  # def create
  #   @cart_item = CartItem.new(cart_item_params)
  #   @cart_item.customer = current_customer
  #   @cart_item.save
  #   redirect_to cart_items_path
  # end

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