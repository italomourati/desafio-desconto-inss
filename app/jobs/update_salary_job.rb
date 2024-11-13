# frozen_string_literal: true

class UpdateSalaryJob < ApplicationJob
  queue_as :default

  def perform(preponent_id, new_salary)
    preponent = Preponent.find(preponent_id)
    discount = Preponent.calculate_inss_discount(new_salary)

    preponent.update(
      salary: new_salary,
      inss_discount: discount
    )
  end
end
