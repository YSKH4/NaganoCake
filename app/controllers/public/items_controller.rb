class Public::ItemsController < ApplicationController
  def index
    #ジャンル一覧表示
    @genres = Genre.all
    #商品一覧表示
    @items = Item.all
  end

  def show
    #商品詳細表示
    #@item = Item.find(params[:id])
    #ジャンル一覧表示
    @genres = Genre.all
    #数量選択
    @cart_item = CartItem.new
  end
end
