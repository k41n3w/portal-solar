# frozen_string_literal: true

require 'rails_helper'
require 'factories/users'
require 'factories/power_generators'

RSpec.describe 'MatchEquipments', type: :request do
  describe 'root GET /' do
    context 'with a perfect match on list' do
      let!(:user) do
        create(:user,
               question_1: 'Destinado principalmente a uso comercial, empresarial.',
               question_2: 'Garantia simples.',
               question_3: 'Display simples.',
               question_4: '10.000,00',
               question_5: 100,
               question_6: 5,
               question_7: %w[laje].first)
      end

      let!(:power_generator_1) do
        create(:power_generator,
               description: 'Destinado principalmente a uso comercial, empresarial.
                                               Garantia simples.
                                               Display simples.',
               price: '10.000,00',
               weight: 99,
               kwp: 4,
               structure_type: %w[laje].first)
      end

      let!(:power_generator_2) { create(:power_generator) }

      before do
        sign_in user
      end

      subject do
        response
      end

      before do
        get(match_equipment_index_path)
      end

      it 'should bring the perfect match' do
        expect(response.body).to include('Encotramos exatamente o que você procura:')
      end

      it { is_expected.to have_http_status(:ok) }
    end

    context 'without a perfect match on list' do
      let!(:user) do
        create(:user,
               question_1: 'A',
               question_2: 'B',
               question_3: 'C',
               question_4: 'D',
               question_5: 999,
               question_6: 99,
               question_7: %w[metalico].first)
      end

      let!(:power_generator_1) do
        create(:power_generator,
               description: 'Destinado principalmente a uso comercial, empresarial.
                                                Garantia simples.
                                                Display simples.',
               price: '10.000,00',
               weight: 99,
               kwp: 4,
               structure_type: %w[laje].first)
      end

      before do
        sign_in user
      end

      subject do
        response
      end

      before do
        get(match_equipment_index_path)
      end

      it 'should bring the perfect match' do
        expect(response.body).not_to include('Encotramos exatamente o que você procura:')
      end

      it { is_expected.to have_http_status(:ok) }
    end

    context 'with none item on list' do
      it { expect(@power_generators).not_to be }

      it { expect(@perfect_match).not_to be }
    end
  end
end
