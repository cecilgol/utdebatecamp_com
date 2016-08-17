Rails.application.routes.draw do
  get 'apply/:camp_nickname', to: 'employee_applications#new',
                              as: :apply_to_work_at_camp
  # post 'apply/:camp_nickname', to: 'employee_applications#create',
  #                              as: :employee_applications

  # get 'applications/:id/edit', to: 'employee_applications#edit',
  #                              as: :edit_employee_application
  # get 'applications/:id/show', to: 'employee_applications#show',
  #                              as: :view_employee_application

  # get 'applications/:camp_id/index', to: 'employee_applications#index',
  #                                    as: :employement_applications

  get 'attend/:camp_nickname', to: 'student_applications#new',
                               as: :apply_to_attend_camp
  # get 'attend/:camp_nickname/edit', to: 'student_applications#edit',
  #                                   as: :edit_student_application
  # get 'attend/:camp_nickname/show', to: 'student_applications#show',
  #                                   as: :view_student_application
  # get 'attendance/:camp_id/index',  to: 'student_applications#index',
  #                                   as: :student_applications

  namespace :admin do
    resources :camps
  end

  resources :employee_applications
  resources :student_applications
  resources :coaches
  resources :directors
  resources :labs
  resources :parents
  resources :students
  resources :camps, only: [:show]
  resources :accounts
  resources :site_administrators
  resources :programs

  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }

  root to: 'static_pages#index'

  get 'static_pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
