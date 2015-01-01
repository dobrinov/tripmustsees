Rails.application.routes.draw do

  # Routing concerns
  concern :imageable do
    resources :images, shallow: true, only: [:create, :destroy]
  end

  # Routes
  namespace :admin do
    resources :countries, concerns: :imageable, except: [:destroy] do
      resources :cities, concerns: :imageable, except: [:destroy] do
        resources :locations, concerns: :imageable
      end
    end

    root to: 'countries#index'
  end


  # Slug based country URLs
  get ':country_slug' => 'countries#show',
        constraints: {
          country_slug:      /[a-z_]+/
        }, as: 'country'


  # Slug based city URLs
  get ':country_slug/:city_slug' => 'cities#show',
        constraints: {
          country_slug:      /[a-z_]+/,
          city_slug:         /[a-z_]+/
        }, as: 'city'


  # Slug based location URLs
  get ':country_slug/:city_slug/:location_slug' => 'locations#show',
        constraints: {
          country_slug:  /[a-z_]+/,
          city_slug:     /[a-z_]+/,
          location_slug: /[a-z_]+/
        }, as: 'location'


  # Static pages
  get 'landingpage' => 'static_pages#landingpage'
  get 'about'       => 'static_pages#about'

  root to: "static_pages#landingpage"
end
