require 'rails_helper'

RSpec.describe "Steps", type: :request do
  before do
    @current_user ||= create(:user)
    sign_in(@current_user)
  end

  def blob
    ActiveStorage::Blob.create_after_upload!(
      io: File.open(Rails.root.join('spec', 'assets', 'cooking-min.jpg')),
      filename: 'cooking-min.jpg'
    )
  end

  describe "POST #create" do
    let(:attr) do
      {
        title: "Some Title",
        description: nil,
        is_public: true,
        deadline: 2.years.from_now,
        image: blob.signed_id
      }
    end
    let!(:activity) { @current_user.activities.create(**attr) }

    let(:params) do
      { step: 
        {
          title: "New Title",
          is_done: false,
          content: nil,
        }
      }
    end

    it "has status :created" do
      post "/activities/#{activity.id}/steps", params: params
      expect(flash[:notice]).to match("New step has been added.")
      expect(response).to have_http_status(:created)
    end
  end
end