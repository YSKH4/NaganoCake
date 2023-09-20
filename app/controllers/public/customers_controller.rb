class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_mypage_path
    else
      render :edit
    end
  end

  def confirm_withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :telephone_number, :email, :is_deleted)
  end
end