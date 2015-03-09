Rails.application.routes.draw do

  root 'welcome#index'

  resources :lifeventures do
    resources :reasons do
    end
  end

  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'
  get 'sign-in', to: 'authentication#new'
  post 'sign-in', to: 'authentication#create'
  get 'sign-out', to: 'authentication#destroy'

end
