# frozen_string_literal: true

json.extract! preponent, :id, :name, :cpf, :birth_date, :address, :number, :neighborhood, :city, :state, :postal_code,
              :personal_phone, :reference_phone, :salary, :inss_discount, :created_at, :updated_at
json.url preponent_url(preponent, format: :json)
