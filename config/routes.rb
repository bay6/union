Union::Application.routes.draw do
  resources :commits


  resources :repositories


  resources :records

  resources :participations

  resources :grades

  resources :projects do
    member do
      post 'join'
      post 'quit'
      post 'finish'
    end
  end

  get "home/index"
  get :union_report, to: 'home#union_report', as: 'union'

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  authenticated :user do
    root to: "home#index"
  end

  as :user do
    root :to => 'projects#index'
    get 'account' => 'registrations#edit', :as => 'account'
  end

  resources :users, :path => '', :only => [:show]
end
