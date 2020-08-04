require 'rails_helper'
require 'factories/users'
require 'factories/power_generators'

RSpec.describe "MatchEquipments", type: :request do
  describe 'root GET /' do
    context 'with a perfect match on list' do
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

    context 'without a perfect match on list' do
      it { expect(@perfect_matcht).to be_nil }
    end

    context 'with none item on list' do
      it { expect(@power_generators).not_to be }
      
      it { expect(@perfect_matcht).not_to be }
    end
  end
end
