require 'rails_helper'

RSpec.describe "Comments", type: :request do
  before do
    @current_user ||= create(:admin)
    sign_in(@current_user)
  end

  describe "POST #create" do
    let(:user) { create(:second_user) }

    let(:params) do
      {
        content: "Comment Content",
        user: @current_user,
        commentable_id: user.id,
        commentable_type: user.class
      }
    end

    it "has status :created" do
      post "/comments", params: params, headers: { "HTTP_REFERER" => "/" }
      expect(flash[:notice]).to match("Comment has been added.")
      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE #destroy" do
    it "has status :ok" do
      delete "/comments", params: { id: @current_user.comments.first.id },
                          headers: { "HTTP_REFERER" => "/" }
      expect(flash[:notice]).to match("Comment has been deleted.")
      expect(response).to have_http_status(:ok)
    end
  end
end
