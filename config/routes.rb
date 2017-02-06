Rails.application.routes.draw do

  # MVC - Model, View, Controller
  # Model - ruby version of a Database Table
  # View - HTML / ERB Code
  # Controller - Pulls a model/models from Database
  # and sets instance variables for our view.
  # Rails is an MVC

  root 'posts#index'

  get 'posts/:id', to: 'posts#show', as: 'post_show'
  get 'post', to:'posts#new'
  get 'edit_post/:id', to: 'posts#edit', as: 'edit_post'

  post 'posts', to: 'posts#create'

  patch 'posts', to: 'posts#update'

  delete 'posts', to: 'posts#destroy'
end
