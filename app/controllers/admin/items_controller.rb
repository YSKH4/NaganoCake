class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @items = Items.all
    @genre = Genre.all
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item= Item.find(params[:id])
    @items = Item.page(params[:page])
  end

  def edit
    @item= Item.find(params[:id])
  end
  
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end
  
  private

  def item_params
    params.require(:item).permit(:item_name, :image, :caption, :genre, :price, :is_active)
  end
end
