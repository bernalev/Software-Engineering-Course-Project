Rails.application.routes.draw do
  get 'students/index'
  get 'notes/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  root 'welcome#index'

  resources :students, :notes
end
