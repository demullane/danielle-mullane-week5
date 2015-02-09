Rails.application.routes.draw do

  resources :locations do
    resources :events
  end

  root 'locations#index'

end
