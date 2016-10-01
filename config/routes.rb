Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'sessions/new'
get 'users/new'

root 'static_pages#home'

get   '/login',  to: 'sessions#new'
post 'login',	   to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

resources :users
resources :posts, only: [:new, :create, :index]

end
