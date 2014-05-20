Daily::Application.routes.draw do

  get 'reg' => 'home#register', :as => 'user_root'
  root 'home#index'


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }




  namespace :director do
    resources :classrooms
    resources :subjects
    resources :users
    resources :teachers
    resources :students
  end

  namespace :teacher do
    resources :subjects, :only => [:index, :show] do
      resources :gread, :except => [:index]
    end
    resources :classrooms, :only => [:index, :show]
  end

  namespace :student do
    resources :subjects, :only => [:index, :show]
  end


  get "student/index"
  get "director/index"
  get "teacher/index"


end
