Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
   namespace :admin do
    resources :genres, only:[:index,:create,:edit,:update]
    resources :items, only:[:index,:new,:create,:show,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:update]
    get "/" => "homes#top", as: "home"
    resources :orders, only:[:show,:update]
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  root to: "public/homes#top"
  get "/about" => "public/homes#about", as: "about"
 
  post "/orders/confirm" => "public/orders#confirm", as: "confirm"
  get "/orders/complete" => "public/orders#complete", as: "complete"
  
  
  delete "/cart_items/destroy_all" => "public/cart_items#destroy_all", as: "destroy_all"
  
  scope module: :public do
  resources :customers, only:[:update,:destroy]
  resources :addresses, only:[:index,:edit,:create,:update,:destroy]
  resources :items, only: [:index,:show]
  resources :cart_items, only:[:index,:update,:destroy,:create]
  resources :orders, only:[:new,:create,:index,:show]

 end

 get "/customers/unsubscribe" => "public/customers#unsubscribe", as: "unsubscribe"
 patch "/customers/withdraw" => "public/customers#withdraw", as: "withdraw"
 get "/customers/my_page" => "public/customers#show", as: "my_page"
 get "/customers/edit_page" => "public/customers#edit", as: "edit_page"
 patch "/customers/:id" => "public/customers#update" , as: "update"

 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end