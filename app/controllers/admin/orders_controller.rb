class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
    update 
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
       @order_details.update_all(making_status: "制作待ち") if @order.status == "入金確認"
    end
      redirect_to admin_order_path(@order)
  end
  
  def order_params
    params.require(:order).permit(:payment_method, :postage, :billing_amount, :status, :zip_code, :shipping_address, :shipping_nameamount)
  end
  
end
