Rails.application.routes.draw do

# Dynamic error pages
get "/404", to: "errors#not_found", :via => :all
get "/422", to: "errors#unacceptable", :via => :all
get "/500", to: "errors#internal_error", :via => :all

 #api parsing review
 namespace :api, defaults: {format: 'json'} do
  namespace :v1 do
    resources :reviews
  end
end
# api parsing item
namespace :api, defaults: {format: 'json'} do
  namespace :v1 do
    resources :items
  end
end

  root to: 'pages#home'
  resources :items, :path => "realisations" do
    resources :reviews
    member do
      delete "destroy_multiple/", action: :destroy_multiple, as: :destroy_multiple
    end
  end
  resources :contacts, only: [:new, :create]
  get 'contact/new'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
