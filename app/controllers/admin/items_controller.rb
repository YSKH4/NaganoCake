class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品情報を登録しました。"
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
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
    if @item.update(item_params)
       flash[:notice] = "商品情報を変更しました。"
       redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end


  # def destroy
  #   @item = Item.find(params[:id])
  #   @item.delete
  #   redirect_to admin_items_path
  # end

  private

  def item_params
    params.require(:item).permit(:name, :image, :caption, :genre_id, :price, :is_active)
  end


end
