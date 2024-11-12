require 'rails_helper'

RSpec.describe Preponent, type: :model do
  it 'is valid with valid attributes' do
    preponent = FactoryBot.build(:preponent)
    expect(preponent).to be_valid
  end

  it 'is not valid without a name' do
    preponent = FactoryBot.build(:preponent, name: nil)
    expect(preponent).not_to be_valid
  end

  describe '.calculate_inss_discount' do
    it 'calculates the correct discount for salary 1000' do
      salary = 1000.00
      expected_discount = 1000.00 * 0.075
      expect(Preponent.calculate_inss_discount(salary)).to eq(expected_discount)
    end

    it 'calculates the correct discount for salary 1800' do
      salary = 1800.00
      expected_discount = (1045.00 * 0.075) + ((1800.00 - 1045.00) * 0.09)
      expect(Preponent.calculate_inss_discount(salary)).to eq(expected_discount)
    end

    it 'calculates the correct discount for salary 2500' do
      salary = 2500.00
      expected_discount = (1045.00 * 0.075) + ((2089.60 - 1045.00) * 0.09) + ((2500 - 2089.60) * 0.12)
      expect(Preponent.calculate_inss_discount(salary)).to eq(expected_discount)
    end

    it 'calculates the correct discount for salary 3000' do
      salary = 3000.00
      expected_discount = (1045.00 * 0.075) + ((2089.60 - 1045.00) * 0.09) + ((3000 - 2089.60) * 0.12)
      expect(Preponent.calculate_inss_discount(salary)).to eq(expected_discount)
    end

    it 'calculates the correct discount for salary 4000' do
      salary = 4000.00
      expected_discount = (1045.00 * 0.075) + ((2089.60 - 1045.00) * 0.09) + ((3134.40 - 2089.60) * 0.12) + ((4000 - 3134.40) * 0.14)
      expect(Preponent.calculate_inss_discount(salary)).to eq(expected_discount)
    end

    it 'calculates the correct discount for salary 5000' do
      salary = 5000.00
      expected_discount = (1045.00 * 0.075) + ((2089.60 - 1045.00) * 0.09) + ((3134.40 - 2089.60) * 0.12) + ((5000 - 3134.40) * 0.14)
      expect(Preponent.calculate_inss_discount(salary)).to eq(expected_discount)
    end
  end
end
