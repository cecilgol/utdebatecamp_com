Rails.application.routes.draw do
  get 'news', to: 'news_posts#index'

  get 'create_account', to: 'static_pages#create_account'

  get 'faq', to: 'faqs#index'

  get 'sidebar/index'

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
    # buncha bullshit rails stuff in /admin
    resources :accounts
    resources :camps
    resources :employees 
    resources :faqs
    resources :labs
    resources :news_posts
    resources :programs
    resources :students
    resources :users
    
    # GET requests in /admin
    get '/', to: 'home#index'
    get '/hired/employees', to: 'employees#hired'
    get '/not_hired/employees', to: 'employees#not_hired'

    # POST (mostly JS) requests in /admin
    post 'hire_employee/:id',to: 'employees#hire',as:'hire_employee'

  end

  resources :coaches
  resources :directors
  resources :labs
  resources :parents
  resources :students, except: [:index] do
    resources :student_applications
  end
  resources :camps, only: [:show], param: :nickname
  resources :accounts, except: [:index]
  resources :site_administrators
  resources :programs


  resources :employees, only: [:new, :edit, :show, :create, :update, :destroy]



  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  root to: 'static_pages#index'

  get 'static_pages/about'

  #get '/apply', to: 'static_pages#apply_to_work'
  
  post 'a/c', to: 'accounts#accountable_change'

  post 'a/p/c', to: 'accounts#create_poly_account'

  get '/apply/(:s)', to: 'accounts#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
