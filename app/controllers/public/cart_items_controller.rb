class Public::CartItemsController < ApplicationController
  def index
    #ショッピングカートテーブル
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new
    
    @cart_item.save
    redirect_to action: "index"
  end

  def update
    @cart_items = CartItem
    redirect_to action: "index"
  end

  def destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.destroy_all
    redirect_to items_path
  end
end

private

def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
end
