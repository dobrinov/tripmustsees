Rails.application.routes.draw do

  namespace :admin do
    resources :countries, except: [:destroy] do
      resources :cities, except: [:destroy] do
        resources :sight_seeings
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

  get 'landingpage' => 'static_pages#landingpage'
  get 'about'       => 'static_pages#about'

  root to: "static_pages#landingpage"
end
