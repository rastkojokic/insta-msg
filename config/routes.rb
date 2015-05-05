Rails.application.routes.draw do
  root 'check_in#new'

  get 'home/index'

  get 'check_in/new'
  post 'check_in/create'

  namespace :api do
    namespace :v1 do
      match "dialect/translate", :to => "dialect#translate", :via => :get
    end
  end
end
