Rails.application.routes.draw do
  resources :animals do
    resources :sightings
  end
  
  root to: 'animals#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
