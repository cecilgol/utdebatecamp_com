Rails.application.routes.draw do
  resources :coaches
  resources :directors
  resources :labs
  resources :parents
  resources :students
  resources :camps
  resources :accounts
  resources :camp_administrators
  resources :programs
  
  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }

  get '/sign_up/:id', to: 'camps#sign_up'

  root to: 'static_pages#index'

  get 'static_pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
