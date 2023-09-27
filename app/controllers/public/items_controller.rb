class Public::ItemsController < ApplicationController
  def index
    #ジャンル一覧表示
    @genres = Genre.all
    #商品一覧表示
    #クリエパラメータ(genre_id)をとりだす
    if @genre_id = params[:genre_id]
      #genre_idが同じものを全てとりだす
      @items_count = Item.where(genre_id: @genre_id)
      @items = Item.where(genre_id: @genre_id).page(params[:page]).per(8)
    #なければ全てとりだす
    elsif item_name = params[:item_name]
      @items_count = Item.where("name LIKE ?","%"+ item_name + "%")
      @items = Item.where("name LIKE ?","%"+ item_name + "%").page(params[:page]).per(8)
    else
      @items_count = Item.all
      @items = Item.all.page(params[:page]).per(8)
    end
  end

  def show
    #ジャンル一覧表示
    @genres = Genre.all
    #商品詳細表示
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
