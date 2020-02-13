Rails.application.routes.draw do
  resources :instructors
  resources :courses
  resources :subjects
  root :to => "page#home"
  get  'course_list',    to: 'courses#index'
  get  'subject_list',    to: 'subjects#index'
  get  'instructor_list',    to: 'instructors#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
