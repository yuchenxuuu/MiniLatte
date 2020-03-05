Rails.application.routes.draw do
  resources :users
  resources :instructors
  resources :courses
  resources :subjects
  resources :enrollments
  
 
  root :to => 'page#home'
  get  'course_list',    to: 'courses#index'
  get  'subject_list',    to: 'subjects#index'
  get  'instructor_list',    to: 'instructors#index'

  get  '/signup', to: 'users#new'
  post '/signup', to: 'user#create'
  
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/enrolled', to: 'user#enrolled_course'
  post '/enroll/:course_id', to: 'user#enroll'
  post '/drop/:course_id', to: 'user#drop'

  
  get '/search', to: 'page#search'
  get '/result', to: 'page#get_result'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
