require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  resources :preponents do
    post 'calculate_inss', on: :collection
    get 'report_by_salary_range', on: :collection
    patch 'update_salary_only', action: :update_salary_only, as: 'update_salary_only'
  end

  root "preponents#index"
end
