Rails.application.routes.draw do

  namespace :admin do
    resources :countries do
      resources :cities do
        resources :sight_seeings
      end
    end

    root to: 'countries#index'
  end

end
