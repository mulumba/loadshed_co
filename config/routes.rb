Rails.application.routes.draw do
  resources :schedules do
    collection { post :import }
  end

  root to: 'visitors#index'
end
