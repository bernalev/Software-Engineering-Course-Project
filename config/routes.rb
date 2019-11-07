Rails.application.routes.draw do
  devise_for :users
  get 'students/index'
  get 'notes/index'
  get 'courses/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  root 'welcome#index'

  resources :students, :notes, :courses
end
