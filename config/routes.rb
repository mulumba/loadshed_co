Rails.application.routes.draw do
  resources :regions
  resources :schedules do
    collection { post :import }
  end

  root to: 'visitors#index'
end
