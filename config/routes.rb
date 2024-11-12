Rails.application.routes.draw do
  resources :preponents

  get "up" => "rails/health#show", as: :rails_health_check

  root "preponents#index"
end
