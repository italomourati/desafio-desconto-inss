require 'sidekiq/web'

Rails.application.routes.draw do
  resources :preponents do
    post 'calculate_inss', on: :collection
    get 'report_by_salary_range', on: :collection
    patch 'update_salary_only', action: :update_salary_only, as: 'update_salary_only'
  end

  get "up" => "rails/health#show", as: :rails_health_check

  mount Sidekiq::Web => '/sidekiq'

  root "preponents#index"
end
