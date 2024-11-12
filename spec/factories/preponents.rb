FactoryBot.define do
  factory :preponent do
    name { Faker::Name.name }
    cpf { Faker::Number.number(digits: 11) }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    address { Faker::Address.street_address }
    number { Faker::Address.building_number }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    postal_code { Faker::Address.zip_code }
    personal_phone { Faker::PhoneNumber.cell_phone }
    reference_phone { Faker::PhoneNumber.cell_phone }
    salary { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    inss_discount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
