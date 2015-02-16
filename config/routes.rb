Rails.application.routes.draw do

  devise_for :users

  # defaults to dashboard
  root "pages#index"

  # TEMP upload pictures
  get 'picture/new'
  post 'picture/create'

  # sample
  get 'dashboard/index'

  # class
  get 'notice' => 'dashboard#notice'
  get 'create' => 'dashboard#new'
  post 'dashboard/create'
  post 'dashboard/add_chooler'
  # TEMP
  get 'dashboard/notice'

  # check
  get 'classbook/:class_id' => 'dashboard#choolers'
  get 'classbook/:class_id/:YYYYMMDD' => 'dashboard#daily'
  # TEMP
  get 'dashboard/daily'

  # chool
  get 'pin/:id' => 'dashboard#pin'
  post 'save_pin' => 'dashboard#save_pin'
  get 'dashboard/pin'

  # view routes
  get '/dashboard' => 'dashboard#index'

  get 'pages/page404'
  get 'pages/page500'
end
