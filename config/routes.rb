Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'desires', to: 'desires#index'
  post 'desires', to: 'desires#create'
end
