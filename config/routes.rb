Rails.application.routes.draw do
  resources :animes, only: [:index, :show]

  concern :anime_showable do
    member do
      get 'show_animes'
    end
  end

  resources :types, only: [:index], concerns: :anime_showable
  resources :seasons, only: [:index], concerns: :anime_showable
  resources :heats, only: [:index] do
    member do
      get 'show_anime'
    end
  end
get 'search', to: 'search#search'
  get 'about', to: 'animes#about'
  root 'animes#index'
end
