require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  before do
    @current_user ||= create(:user)
    sign_in(@current_user)
  end

  describe "GET /show" do
    it "has status :ok" do
      get "/profiles", params: {id: @current_user.id}
      expect(response).to have_http_status(:ok)
    end
  end
end
