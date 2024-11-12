# frozen_string_literal: true

class Preponent < ApplicationRecord
  validates :name, :cpf, :birth_date, :address, :number, :neighborhood, :city, :state, :postal_code,
            :personal_phone, :reference_phone, :salary, :inss_discount, presence: true

  def self.calculate_inss_discount(salary)
    faixas = [
      { limite: 1045.00, aliquota: 0.075 },
      { limite: 2089.60, aliquota: 0.09 },
      { limite: 3134.40, aliquota: 0.12 },
      { limite: 6101.06, aliquota: 0.14 }
    ]

    discount = 0
    previous_limit = 0

    faixas.each do |faixa|
      if salary > faixa[:limite]
        discount += (faixa[:limite] - previous_limit) * faixa[:aliquota]
        previous_limit = faixa[:limite]
      else
        discount += (salary - previous_limit) * faixa[:aliquota]
        break
      end
    end

    discount
  end
end
