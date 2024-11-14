# frozen_string_literal: true

class UpdateSalaryJob < ApplicationJob
  queue_as :default

  rescue_from(ActiveRecord::RecordNotFound) do |exception|
    Rails.logger.error "Preponent not found with ID #{preponent_id}: #{exception.message}"
  end

  def perform(preponent_id, new_salary)
    return unless valid_salary?(new_salary)

    preponent = Preponent.find(preponent_id)
    discount = Preponent.calculate_inss_discount(new_salary)

    if preponent.update(salary: new_salary, inss_discount: discount)
      Rails.logger.info "Updated salary for Preponent ID #{preponent_id} to #{new_salary} with INSS discount #{discount}"
    else
      Rails.logger.error "Failed to update salary for Preponent ID #{preponent_id}"
    end
  end

  private

  def valid_salary?(salary)
    salary.is_a?(Numeric) && salary.positive?
  end
end
