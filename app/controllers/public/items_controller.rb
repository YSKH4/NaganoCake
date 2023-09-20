class Public::ItemsController < ApplicationController
  def index
    #ジャンル一覧表示
    @genres = Genre.all
    #商品一覧表示
    #クリエパラメータ(genre_id)を取得
    if @genre_id = params[:genre_id]
      #genre_idが同じものを全て取得
      @items = Item.where(genre_id: @genre_id)
    #なければ全て取り出す
    else
      @items = Item.all
    end

  end

  def show
    #商品詳細表示
    @item = Item.find(params[:id])
    #ジャンル一覧表示
    @genres = Genre.all
    #数量選択
    @cart_item = CartItem.new
  end
end
