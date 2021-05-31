Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only:[:index, :show] do 
    resources :messages, only:[:create]
  end
  resources :pets, only:[:new, :create]
  resources :pet_sitters, only:[:index, :show, :new, :create] do
    resources :bookings, only:[:create]
  end
  resources :bookings, only:[:index, :update]
  resources :announcements, only:[:index, :new, :create]
  resources :friends, only:[:index, :show] do
    post 'request_friendship'
    post 'accept_request'
    delete 'decline_request'
    delete 'remove_friend'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
