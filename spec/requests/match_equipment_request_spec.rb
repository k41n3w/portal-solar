require 'rails_helper'

RSpec.describe "MatchEquipments", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/match_equipment/index"
      expect(response).to have_http_status(:success)
    end
  end
end
