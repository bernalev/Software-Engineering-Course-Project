Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  root 'welcome#index'

  resources :students, :courses, :schools, :users, :notes, :course_instances

  resources :course_instances do 
  	resources :notes
  end
end
