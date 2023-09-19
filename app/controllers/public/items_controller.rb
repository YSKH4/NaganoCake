class Public::ItemsController < ApplicationController
  def index
    #ジャンル一覧表示
    @genres = Genre.all
    #商品一覧表示
    @items = Item.all
  end

  def show
    #ジャンル一覧表示
    @genres = Genre.all
    #商品詳細表示
    #@item = Item.find(params[:id])
  end
end
