Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => 'users/omniauth_callbacks'}
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  root 'welcome#index'

  get 'sites/privacy_policy'
  get 'sites/terms_of_service'
  get 'sites/faq'

  resources :courses, :schools, :users, :notes, :course_instances, :tutor_ads, :groups
  resources :course_instances do 
  	resources :notes
  end
end
