require 'rails_helper'

RSpec.describe "MatchEquipments", type: :request do

  describe 'root GET /' do
    let!(:user) { create(:user) }
    let!(:power_generator_1) { create(:power_generator) }
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
    
    it 'must respond with status code :ok (200)' do
      is_expected.to have_http_status(:ok)
    end
  end
end
