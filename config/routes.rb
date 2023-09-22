Rails.application.routes.draw do
  namespace :admin do
    resources :orders,only: [:show, :update]

    resources :customers, only: [:index, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]

    get '/' => "homes#top"
  end

  scope module: :public do
    resources :addresses,only: [:index, :edit, :create, :update, :destroy]

    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/thanx' => 'orders#thanx'
    post 'orders/comfirm' => 'orders#comfirm'

    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]

    get 'customers/mypage' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/confirm_withdraw' => 'customers#confirm_withdraw'
    patch 'customers/withdraw' => 'customers#withdraw'

    resources :items,only: [:index, :show]

    root to: "homes#top"
    get 'homes/about'
  end


# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: 'public/registrations',
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: 'admin/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end