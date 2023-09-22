class Public::ItemsController < ApplicationController
  def index
    #ジャンル一覧表示
    @genres = Genre.all
    #商品一覧表示
    #クリエパラメータ(genre_id)をとりだす
    if @genre_id = params[:genre_id]
      #genre_idが同じものを全てとりだす
      @items = Item.where(genre_id: @genre_id)
    #なければ全てとりだす
    else
      @items = Item.all
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
