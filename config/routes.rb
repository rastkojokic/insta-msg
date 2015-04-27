Rails.application.routes.draw do
  get 'chat/index'

  root 'check_in#new'

  get 'check_in/new'
  post 'check_in/create'
end
