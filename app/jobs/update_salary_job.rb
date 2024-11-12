# frozen_string_literal: true

class UpdateSalaryJob < ApplicationJob
  queue_as :default

  def perform(preponent_id, new_salary)
    preponent = Preponent.find(preponent_id)

    preponent.update(salary: new_salary)
  end
end
