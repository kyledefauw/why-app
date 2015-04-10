Rails.application.routes.draw do

  root 'static_pages#index'

  get '/purpose', to: 'static_pages#purpose'
  get '/all_obstacles', to: 'static_pages#all_obstacles'


  resources :users, only: [:edit, :show, :index, :update]

  resources :life_ventures do
    resources :reasons, except: [:show]
    resources :steps, except: [:show]
  end

  resources :steps do
    resources :obstacles
  end

  resources :obstacles do
    resources :comments
  end


  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'
  get 'sign-in', to: 'authentication#new'
  post 'sign-in', to: 'authentication#create'
  get 'sign-out', to: 'authentication#destroy'

end
