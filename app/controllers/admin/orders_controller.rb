class Admin::OrdersController < ApplicationController
  def show
    @order = @item= Item.find(params[:id])
  end
end
