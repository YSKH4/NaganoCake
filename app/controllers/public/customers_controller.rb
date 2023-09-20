class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    
  end

  def confirm_withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :password, :remember_me, :first_name, :last_name, :last_name_kana, :first_name_kana, :zip_code, :address, :telephone_number)
  end
end
