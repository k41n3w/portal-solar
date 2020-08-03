require 'rails_helper'
require 'factories/users'
require 'factories/power_generators'

RSpec.describe PowerGenerator, type: :model do
	context 'find_principal_answers(current_user)' do
		let!(:user) { create(:user) }
		let!(:power_generator) { create(:power_generator) }
		
		it 'expect some power_generators' do
			expect(PowerGenerator.find_principal_answers(user)).not_to be_nil
		end
	end

	context 'find_max_value(answer, attribute, power_generators)' do
		let!(:user) { create(:user, question_6: '9.0') }
		let!(:power_generator_1) { create(:power_generator, kwp: '100.0') }
		let!(:power_generator_2) { create(:power_generator, kwp: '7.0') }
		
		it 'expect some power_generators' do
			power_generators = PowerGenerator.all

			expect(PowerGenerator.find_max_value(user.question_6, 'kwp', power_generators).count).to eq(1)
		end
	end

	context 'find_structure_type(answer, perfect_match)' do
		let!(:user) { create(:user, question_7: 'metalico') }
		let!(:power_generator_1) { create(:power_generator, structure_type: 'metalico') }
		let!(:power_generator_2) { create(:power_generator, structure_type: 'laje') }
		
		it 'expect some power_generators' do
			perfect_match = PowerGenerator.all

			expect(PowerGenerator.find_structure_type(user.question_7, perfect_match).count).to eq(1)
		end
	end

	describe 'validate_and_find_cep(cep)', :vcr do
		let!(:power_generator) { create(:power_generator) }
		
		context 'with correct cep' do
			it 'expect a correct return for cep' do
				expect(PowerGenerator.validate_and_find_cep('13770-000', power_generator)).not_to be_nil
			end
		end

		context 'with correct cep' do
			it 'expect a correct return for cep' do
				expect(PowerGenerator.validate_and_find_cep('13770-00', power_generator)).to be_nil
			end
		end
	end

	describe 'find_cep(cep)', :vcr do
		it 'expect a correct return for cep' do
			expect(PowerGenerator.find_cep('13770-000')).not_to be_nil
		end
	end
end