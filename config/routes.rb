Rails.application.routes.draw do
  get 'messages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  devise_for :users

  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create,:destroy]
    resources :book_comments, only: [:create,:destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    # resources :messages, only: [:show, :create]
    get "messages/:id" => "messages#show", as: "message"
    post "messages/:id" => "messages#create", as: "message_post"
    resource :relationships, only: [:create, :destroy]
    get "follow" => "relationships#follow", as: "follow"
    get "followed" => "relationships#followed", as: "followed"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end