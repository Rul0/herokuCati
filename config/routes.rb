Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  authenticated :user do
      root 'welcome#index'
    end
    unauthenticated :user do
      devise_scope :user do
        root 'devise/sessions#new', as: :unregistered_root
      end
    end
  resources :respondents do
    collection {post :import}
  end
  resources :projects
  get 'welcome/index'
  root 'welcome#index'
  get 'projects/:id/calls' => 'projects#calls', :as => :calls_project
  match 'projects/:id/calls'=> 'projects#state', via: [:post, :patch], :as => :state_project

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'token/generate' => 'token#generate'
  post 'call/connect' => 'call#connect'

end
