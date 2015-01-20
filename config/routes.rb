Rails.application.routes.draw do

  # Routing concerns
  concern :imageable do
    resources :images, shallow: true, only: [:create, :destroy]
  end

  # Routes
  namespace :admin do
    resources :countries, concerns: :imageable, except: [:destroy] do
      resources :cities, only: [:index, :new, :create]
    end

    resources :cities, concerns: :imageable, only: [:show, :edit, :update] do
      resources :locations, only: [:index, :new, :create]
    end

    resources :locations, concerns: :imageable, only: [:show, :edit, :update, :destroy]

    root to: 'countries#index'
  end


  resources :countries, only: [] do
    resources :cities, only: [:index]
  end

  resources :cities, only: [:index] do
    resources :locations, only: [:index]
  end

  resources :locations, only: [:show]


  # Static pages
  get 'landingpage' => 'static_pages#landingpage'
  get 'about'       => 'static_pages#about'


  # Slug based country URLs
  get ':country_slug' => 'countries#show',
        constraints: {
          country_slug:      /[a-z_]+/
        }, as: 'country_slug'


  # Slug based city URLs
  get ':country_slug/:city_slug' => 'cities#show',
        constraints: {
          country_slug:      /[a-z_]+/,
          city_slug:         /[a-z_]+/
        }, as: 'city_slug'


  # Slug based location URLs
  get ':country_slug/:city_slug/:location_slug' => 'locations#show',
        constraints: {
          country_slug:  /[a-z_]+/,
          city_slug:     /[a-z_]+/,
          location_slug: /[a-z_]+/
        }, as: 'location_slug'


  root to: "static_pages#landingpage"
end
