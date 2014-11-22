Rails.application.routes.draw do

  namespace :admin do
    resources :countries do
      resources :cities do
        resources :locations
      end
    end
  end

end
