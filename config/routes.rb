Rails.application.routes.draw do

  root :to => 'page#home'
  get  'course_list',    to: 'courses#index'
  get  'subject_list',    to: 'subjects#index'
  get  'instructor_list',    to: 'instructors#index'

  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/enrolled', to: 'users#enrolled_course'
  post '/enroll/:course_id', to: 'users#enroll'
  post '/drop/:course_id', to: 'users#drop'

  post '/search', to: 'page#do_search'
  get '/search', to: 'page#show_search'

  resources :users
  resources :instructors
  resources :courses
  resources :subjects
  resources :enrollments

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
