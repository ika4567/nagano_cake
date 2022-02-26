Rails.application.routes.draw do

  namespace :admin do
    resources :order_details, only: [:update]
  end

  namespace :admin do
    resources :orders, only: [:show, :update]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace :admin do
    resources :items, only: [:new, :index, :show, :edit, :create, :update]
  end

  namespace :admin do
    get 'homes/top'
    root to: "homes#top"
  end

  scope module: :public do
    root to: "homes#top"
    get 'about' => 'homes#about', as: 'about'

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    resources :orders, only: [:new, :index, :show, :create]
    post 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
    get 'orders/thanks'

    resources :cart_items, only: [:index]
    patch 'cart_items/:id' => 'cart_items#update', as: 'cart_items_update'
    delete 'cart_items/:id' => 'cart_items#destroy', as: 'cart_items_destroy'
    delete 'cart_items/destroy_all', as: 'cart_items_destroy_all'
    post 'cart_items' => 'cart_items#create', as: 'cart_items_create'

    resources :items, only: [:index, :show]

    resource :customers, only: [:edit, :update]
    get 'customers/cancel'
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'customers_withdraw'

  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
