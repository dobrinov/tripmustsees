Rails.application.routes.draw do

  # Routing concerns
  concern :imageable do
    resources :images, shallow: true, only: [:create, :destroy]
  end

  # Routes
  namespace :admin do
    resources :countries, concerns: :imageable, except: [:destroy] do
      resources :cities, concerns: :imageable, except: [:destroy] do
        resources :sight_seeings, concerns: :imageable
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
        }, as: 'cities'


  # Slug based sight seeing URLs
  get ':country_slug/:city_slug/:sight_seeing_slug' => 'sight_seeings#show',
        constraints: {
          country_slug:      /[a-z_]+/,
          city_slug:         /[a-z_]+/,
          sight_seeing_slug: /[a-z_]+/
        }, as: 'sight_seeing'


  # Static pages
  get 'landingpage' => 'static_pages#landingpage'
  get 'about'       => 'static_pages#about'

  root to: "static_pages#landingpage"
end
