require 'rails_helper'

RSpec.describe "Ratings", type: :request do
  before do
    @current_user ||= create(:user)
    sign_in(@current_user)
  end

  describe "POST #create" do
    let(:user) { create(:second_user) }
    let(:params) do
      {
        grade: (1..5).to_a.sample,
        user: @current_user,
        ratingable_id: user.id,
        ratingable_type: user.class 
      }
    end

    it "has status :created" do
      post "/ratings", params: params, headers: { "HTTP_REFERER" => "/" }
      expect(response).to have_http_status(:created)
    end
  end
end
