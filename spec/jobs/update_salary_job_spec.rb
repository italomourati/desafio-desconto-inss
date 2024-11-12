require 'rails_helper'

RSpec.describe UpdateSalaryJob, type: :job do
  let(:preponent) { create(:preponent) }
  let(:new_salary) { 5000.0 }

  describe '#perform' do
    it 'updates the preponent salary' do
      expect(preponent.salary).not_to eq(new_salary)

      UpdateSalaryJob.perform_now(preponent.id, new_salary)

      preponent.reload

      expect(preponent.salary).to eq(new_salary)
    end
  end
end
