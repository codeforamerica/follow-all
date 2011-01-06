FollowAll::Application.routes.draw do
  get 'sessions/callback', :to => 'sessions#callback', :as => :callback
  resources :sessions
  resources :follows
  root :to => 'sessions#new'
end
