class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  before_action :is_matching_login_customer, only: [:edit, :update]

  def index
    @addresses = current_customer.addresses.all
    @address = Address.new

  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end


  private

  def address_params
    params.require(:address).permit(:zip_code, :shipping_address, :shipping_name, :customer_id)
  end

  def is_matching_login_customer
    address = Address.find(params[:id])
    unless address.customer.id == current_customer.id
      redirect_to root_path
    end
  end
end
