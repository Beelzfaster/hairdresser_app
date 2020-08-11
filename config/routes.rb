Rails.application.routes.draw do

  get 'home/set_cookie'
  get 'home/show_cookie'
  get 'home/delete_cookie'
  get 'appointments/index'
  get 'appointments/show'
  get 'appointments/new'
  get 'appointments/edit'
  resources :bookings do
    resources :appointments
  end
  devise_for :barbers
  root to: 'pages#home'
  devise_for :users
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_scope :barber do
   get '/barbers/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
