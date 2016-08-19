Rails.application.routes.draw do
  # get 'apply/:camp_nickname', to: 'employee_applications#new',
  #                             as: :apply_to_work_at_camp
  # post 'apply/:camp_nickname', to: 'employee_applications#create',
  #                              as: :employee_applications

  # get 'applications/:id/edit', to: 'employee_applications#edit',
  #                              as: :edit_employee_application
  # get 'applications/:id/show', to: 'employee_applications#show',
  #                              as: :view_employee_application

  # get 'applications/:camp_id/index', to: 'employee_applications#index',
  #                                    as: :employement_applications

  #get 'register/:camp_nickname', to: 'student_applications#new',
  #                               as: :apply_to_camp
  # get 'attend/:camp_nickname/edit', to: 'student_applications#edit',
  #                                   as: :edit_student_application
  # get 'attend/:camp_nickname/show', to: 'student_applications#show',
  #                                   as: :view_student_application
  # get 'attendance/:camp_id/index',  to: 'student_applications#index',
  #                                   as: :student_applications

  namespace :admin do
    resources :camps
    resources :employees, only: [:index]
  end

  resources :coaches
  resources :directors
  resources :labs
  resources :parents
  resources :students, except: [:index] do
    resources :student_applications
  end
  resources :camps, only: [:show]
  resources :accounts
  resources :site_administrators
  resources :programs

  resources :employees, param: :employee_id, except: [:index] do
    get 'apply/:camp_id', to: 'employees#apply_to_camp',
                          as: :apply_to_camp
    post 'apply/:camp_id', to: 'employees#create_application',
                          as: :create_application
    # resources :employee_applications
  end

  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }

  root to: 'static_pages#index'

  get 'static_pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
