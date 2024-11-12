Rails.application.routes.draw do
  resources :preponents do
    post 'calculate_inss', on: :collection
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "preponents#index"
end
