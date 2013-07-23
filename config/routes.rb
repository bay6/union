Union::Application.routes.draw do

  resources :badges, :except =>[:show]

  resources :messages, :only => [:index, :destroy] do
    collection do
      post 'clear'
    end
  end

  resources :notices

  resources :commits

  resources :repositories

  resources :records

  resources :participations

  resources :grades

  resources :activities do
    member do
      post :register
    end

    resources :comments
  end

  resources :projects do
    member do
      post 'join'
      post 'quit'
      post 'finish'
    end
  end


  get "home/index"
  get :instruction, to: 'home#instruction', as: 'instruction'
  get :union_report, to: 'home#union_report', as: 'union'
  get 'ongoing', to: 'projects#ongoing', as: 'ongoing'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, :path => '', :only => [:show, :update]

  authenticated :user do
    root to: "home#index"
  end

  as :user do
    root :to => 'projects#ongoing'
    get 'account' => 'registrations#edit', :as => 'account'
  end

  get "/ranking" => "users#ranking", as: "rankings"
  get "/users" => "users#index", as: "users"
  get "/user/:id/edit" => "users#edit", as: "edit_user"
  get "search" => "projects#ongoing"
  get 'badges/:name_en', to: 'badges#show', as: 'show'
  get "comments/create"
end
