class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      flash[:notice] = "編集を保存しました。"
      redirect_to customer_mypage_path(current_user.id)
    else
      render :edit
    end
  end

  def confirm_withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :last_name_kana, :first_name_kana, :zip_code, :address, :telephone_number)
  end
end