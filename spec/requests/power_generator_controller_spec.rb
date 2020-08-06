# frozen_string_literal: true

require 'rails_helper'
require 'factories/users'
require 'factories/power_generators'
require 'factories/freights'

RSpec.describe 'PowerGeneratorsController', type: :request do
  describe 'root GET /' do
    let!(:user) { create(:user) }
    let!(:power_generator) { create(:power_generator) }

    before do
      sign_in user
    end

    subject do
      response
    end

    before do
      get(root_path)
    end

    it 'must respond with status code :ok (200)' do
      is_expected.to have_http_status(:ok)
    end
  end

  describe 'GET /power_generators/:id' do
    let!(:user) { create(:user) }
    let!(:power_generator) { create(:power_generator) }

    before do
      sign_in user
    end

    subject do
      response
    end

    before do
      get(power_generator_path(power_generator.id))
    end

    it 'must respond with status code :ok (200)' do
      is_expected.to have_http_status(:ok)
    end

    context 'with correct cep param', :vcr do
      let!(:power_generator_with_cep) { create(:power_generator, cubage: 1.0) }
      let!(:freight) { create(:freight, weight_max: 2.0, state: 'SP') }
      let!(:params) { { cep: '13770-000' } }

      before do
        sign_in user
      end

      subject do
        response
      end

      before do
        get(power_generator_path(power_generator_with_cep.id), params: params)
      end

      it 'should bring cep cost' do
        expect(response.body).to include('Custo do frete para:')
      end
    end

    context 'with incorrect cep param' do
      let!(:power_generator_with_cep) { create(:power_generator, cubage: 1.0) }
      let!(:freight) { create(:freight, weight_max: 2.0, state: 'SP') }
      let!(:params) { { cep: '13770-00' } }

      before do
        sign_in user
      end

      subject do
        response
      end

      before do
        get(power_generator_path(power_generator_with_cep.id), params: params)
      end

      it 'should bring cep cost' do
        expect(response.body).not_to include('Custo do frete para: Caconde-SP')
      end
    end
  end
end
