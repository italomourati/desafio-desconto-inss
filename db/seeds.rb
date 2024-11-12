# frozen_string_literal: true

require 'faker'
require 'cpf_faker'

20.times do
  salary = rand(1000..10_000)

  Preponent.create!(
    name: Faker::Name.name,
    cpf: Faker::CPF.pretty,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    address: Faker::Address.street_address,
    number: Faker::Number.number(digits: 4),
    neighborhood: Faker::Address.community,
    city: Faker::Address.city,
    state: Faker::Address.state,
    postal_code: Faker::Address.zip_code,
    personal_phone: Faker::PhoneNumber.phone_number,
    reference_phone: Faker::PhoneNumber.phone_number,
    salary: Faker::Number.decimal(l_digits: 4, r_digits: 2),
    inss_discount: Preponent.calculate_inss_discount(salary)
  )
end
