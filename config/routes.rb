Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get "/home/about" => "homes#about", as: "about"
  post "/users/:id" => "users#show"
  get "/users" => "users#index", as: "users_index"



  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # ログアウトがdeleteメソッドと記入しているが、Getで呼び出されてしまうようなので追加。

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]

  resources :users, only: [:show, :index,  :update, :create, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end