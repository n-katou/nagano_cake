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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end