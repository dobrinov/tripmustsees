Rails.application.routes.draw do

  namespace :admin do
    resources :countries, only: [:index, :new, :create] do
      resources :cities, only: [:index, :new, :create] do
        resources :sight_seeings
      end
    end

    root to: 'countries#index'
  end

  resources :sight_seeings, only: [:show]

  get 'landingpage' => 'static_pages#landingpage'
  get 'about'       => 'static_pages#about'

  root to: "static_pages#landingpage"
end
