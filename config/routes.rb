Daily::Application.routes.draw do

  get 'reg' => 'home#register', :as => 'user_root'
  root 'home#index'
  post 'auth/:provider/callback', to: 'session#create'
  post 'auth/failure', to: redirect('/')

  devise_for :users, :path => "",
              :controllers => { sessions: "sessions" },
              :path_names => {
                  :sign_in => 'login',
                  :sign_out => 'logout',
                  :password => 'forgot_password',
                  :confirmation => 'verification',
                  :unlock => 'unblock',
                  :registration => 'register',
                  :sign_up => ''
              }

  namespace :director do
    resources :classrooms
    resources :subjects
    resources :users
    resources :teachers
    resources :students
  end

  namespace :teacher do
    resources :subjects, :only => [:index, :show]
    resources :classrooms, :only => [:index, :show]
  end




  get "student/index"
  get "director/index"
  get "teacher/index"


end
