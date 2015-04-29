Rails.application.routes.draw do
  root 'check_in#new'

  get 'home/index'

  get 'check_in/new'
  post 'check_in/create'
end
