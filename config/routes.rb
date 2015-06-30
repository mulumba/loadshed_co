Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :documents do
    collection { post :import }
  end

end
