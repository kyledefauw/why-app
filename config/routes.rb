Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, only: [:edit, :show, :index, :update]

  resources :life_ventures do
    resources :reasons
  end

  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'
  get 'sign-in', to: 'authentication#new'
  post 'sign-in', to: 'authentication#create'
  get 'sign-out', to: 'authentication#destroy'

end
