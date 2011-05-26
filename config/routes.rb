Ramblebee::Application.routes.draw do
  devise_for :installs

#  devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :tours do
    resources :points
  end
  
#  get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  match '/tours/:id/sort_points' => 'tour#show', :as => 'sort_points', :defaults => {:sort_points => true}
  match '/toggle_point_completed/:id' => 'points#toggle_completed', :as => 'toggle_point_completed', :via => :put
  
  
  root :to => "tours#index"
end
