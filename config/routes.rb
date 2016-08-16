Rails.application.routes.draw do
  get 'apply/:camp_nickname/', to: 'employee_applications#new',
                               as: :apply_to_work_at_camp
  get 'applications/:id/edit', to: 'employee_applications#edit'
  get 'applications/:id/show', to: 'employee_applications#show'
  get 'applications/:camp_id/index', to: 'employee_applications#index',
                                   as: :employement_applications

  resources :coaches
  resources :directors
  resources :labs
  resources :parents
  resources :students
  resources :camps
  resources :accounts
  resources :site_administrators
  resources :programs
  
  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }

  root to: 'static_pages#index'

  get 'static_pages/about'
  get '/application', to: 'static_pages#apply_to_work', as: :work_application

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
