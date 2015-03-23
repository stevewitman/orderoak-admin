Rails.application.routes.draw do
  root "pages#index"
  resources :users
  resources :stores do
    resources :menuitems
    resources :memberships
  end

  get '/sign-up' => 'registration#new', as: :signup
  post '/sign-up' => 'registration#create'
  get '/sign-in' => 'authentication#new', as: :signin
  post '/sign-in' => 'authentication#create'
  get '/sign-out' => 'authentication#destroy', as: :signout

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :stores
    end
  end

end
