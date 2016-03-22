Rails.application.routes.draw do

  resources :locals do
    resources :events
  end

  devise_for :users, :controllers => {registrations: 'registrations'}
  #typo!
  root 'welocme#index'
  get '/register' => 'welocme#register_choice'
  get '/profile' => 'users#profile'
end
