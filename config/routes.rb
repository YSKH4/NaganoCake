Rails.application.routes.draw do
  namespace :admin do
    resources :orders,only: [:show, :update]
  end
  
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  
  namespace :admin do
    get 'homes/top'
  end
  
  scope module: :public do
    resources :addresses,only: [:index, :edit, :create, :update, :destroy]
  end
  
  scope module: :public do
    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/thanx' => 'orders#thanx'
    post 'orders/comfirm' => 'orders#comfirm'
  end
  
  scope module: :public do
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  end
  
  scope module: :public do
    get 'customers/mypage' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/confirm_withdraw' => 'customers#confirm_withdraw'
    patch 'customers/withdraw' => 'customers#withdraw'
  end
  
  scope module: :public do
    resources :items,only: [:index, :show]
  end
  
  scope module: :public do
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
