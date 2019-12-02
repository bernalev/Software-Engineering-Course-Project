Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => 'users/omniauth_callbacks'}
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  root 'welcome#index'

  get 'sites/privacy_policy'
  get 'sites/terms_of_service'
  get 'sites/faq'
  get 'sites/contact_us'
  post 'sites/contact_us/create'

  resources :courses, :schools, :users, :notes, :course_instances, :tutor_ads, :groups, :ratings, :messages
  resources :course_instances do 
  	resources :notes
  end

  resources :notes do
    resources :ratings
  end
end
