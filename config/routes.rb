Rails.application.routes.draw do
  get '.well-known/acme-challenge/J2vwy8GxBVdTpiCMopCHR3zXOYYoKTYXdOe8T7M1T8E', to: 'static_pages#letsencrypt'
  get 'news', to: 'news_posts#index'
  get 'create_account', to: 'static_pages#create_account'
  get 'faq', to: 'faqs#index'
  get 'sidebar/index'
  namespace :admin do
    get '/', to: 'home#index'
    get '/hired/employees', to: 'employees#hired'
    get '/not_hired/employees', to: 'employees#not_hired'
    post 'hire_employee/:id',to: 'employees#hire',as:'hire_employee'
    get '/events/modal', to: 'events#modal'
    get '/events/camp-id-program', to: 'events#camp_id_program'
    resources :accounts
    resources :camps
    resources :employees
    resources :events 
    resources :faqs
    resources :labs
    resources :news_posts
    resources :programs
    resources :students
    resources :users
  end
  resources :coaches
  resources :directors
  resources :labs
  resources :parents
  resources :students, except: [:index] do
    resources :student_applications
  end
  resources :camps, param: :nickname do
    get '/', to:'camps#show'
    get '/staff', to: 'camps#staff'
  end
  resources :accounts, except: [:index]
  resources :site_administrators
  resources :programs
  resources :employees, only: [:new, :edit, :show, :create, :update, :destroy] do
    patch '/avatar_upload', to: 'employees#avatar_upload'
  end
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    :omniauth_callbacks => "users/omniauth_callbacks"
  }
  root to: 'static_pages#index'
  get 'static_pages/about'
  
  post 'a/c', to: 'accounts#accountable_change'
  post 'a/p/c', to: 'accounts#create_poly_account'
  get '/apply/(:s)', to: 'accounts#new'
end
