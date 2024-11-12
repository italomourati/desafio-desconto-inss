Rails.application.routes.draw do
  resources :preponents do
    post 'calculate_inss', on: :collection
    get 'report_by_salary_range', on: :collection
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "preponents#index"
end
