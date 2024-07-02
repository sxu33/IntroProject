Rails.application.routes.draw do
  get 'pages/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  
Rails.application.routes.draw do
  resources :animes, only: [:index, :show]

  concern :anime_showable do
    member do
      get 'show_animes'
    end
  end

  resources :types, only: [:index], concerns: :anime_showable
  resources :seasons, only: [:index], concerns: :anime_showable
  resources :heats, only: [:index], concerns: :anime_showable

  get 'about', to: 'animes#about'
  root 'animes#index'
end
