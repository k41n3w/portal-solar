# frozen_string_literal: true

require 'rails_helper'
require 'factories/users'
require 'factories/power_generators'
require 'factories/freights'

RSpec.describe PowerGenerator, type: :model do
  describe '.find_principal_generators(current_user)' do
    let!(:user) { create(:user) }
    let!(:power_generator) { create(:power_generator) }

    it 'expect some power_generators' do
      expect(PowerGenerator.find_principal_generators(user)).not_to be_nil
    end
  end

  describe '.find_max_value(answer, attribute, power_generators)' do
    let!(:user) { create(:user, question_6: '9.0') }
    let!(:power_generator_1) { create(:power_generator, kwp: '100.0') }
    let!(:power_generator_2) { create(:power_generator, kwp: '7.0') }

    it 'expect some power_generators' do
      power_generators = PowerGenerator.all

      expect(PowerGenerator.find_max_value(user.question_6, 'kwp', power_generators).count).to eq(19)
    end
  end

  describe '.find_structure_type(answer, perfect_match)' do
    let!(:user) { create(:user, question_7: 'metalico') }
    let!(:power_generator_1) { create(:power_generator, structure_type: 'metalico') }
    let!(:power_generator_2) { create(:power_generator, structure_type: 'laje') }

    it 'expect some power_generators' do
      perfect_match = PowerGenerator.all

      expect(PowerGenerator.find_structure_type(user.question_7, perfect_match).count).to eq(5)
    end
  end

  describe '.validate_cep' do
    context 'with value nil' do
      it { expect(PowerGenerator.validate_cep(nil)).to be_nil }
    end

    context 'with char size count != 9' do
      it { expect(PowerGenerator.validate_cep(nil)).to be_nil }
    end

    context 'with a valid cep' do
      it { expect(PowerGenerator.validate_cep('13770-000')).to be_truthy }
    end
  end

  describe '.find_cep(cep)', :vcr do
    it { expect(PowerGenerator.find_cep('13770-000')).to be }
  end

  describe '.find_cost(power_generator, address)' do
    let!(:power_generator) { create(:power_generator, cubage: 1.0) }
    let!(:freight) { create(:freight, weight_max: 2.0, state: 'MG') }

    it 'expect a correct return for cep' do
      expect(PowerGenerator.find_cost(power_generator, 'MG')).not_to be_nil
    end
  end

  describe '.name_ilike(name)' do
    let!(:power_generator) { create(:power_generator, description: 'power_generator_1') }

    it { expect(PowerGenerator.name_ilike('power_generator_1').count).to eq(19) }
  end
end
