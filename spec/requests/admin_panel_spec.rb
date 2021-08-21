require 'rails_helper'

RSpec.describe "AdminPanel", type: :request do
  before do
    @current_user ||= create(:admin)
    sign_in(@current_user)
  end

  describe "GET #show" do
    it "has status :ok" do
      get "/admin_panel"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE #destroy" do
    let(:user) { create(:second_user) }

    it "has status :ok" do
      delete "/admin_panel", params: { id: user.id }
      expect(flash[:notice]).to match("User has been deleted.")
      expect(response).to have_http_status(:ok)
    end
  end
end
