# frozen_string_literal: true

require 'rails_helper'
require 'factories/users'
require 'factories/power_generators'

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
  end
end