class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @cart_items = @order.cart_items
  end
end
