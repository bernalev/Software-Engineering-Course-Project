Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => 'users/omniauth_callbacks'}
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  root 'welcome#index'


  resources :courses, :schools, :users, :notes, :course_instances, :tutor_ads, :groups
  resources :course_instances do 
  	resources :notes
  end
end
