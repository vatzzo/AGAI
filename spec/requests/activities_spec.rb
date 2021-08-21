require 'rails_helper'

RSpec.describe "ActivitiesControllers", type: :request do 
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

  describe "GET #index" do
    it "has status :ok" do
      get "/activities"
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
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

    it "has status :ok" do
      get "/activities/#{activity.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    let(:params) do
      { activity: 
        {
          title: "New Title",
          is_public: false,
          description: nil,
          deadline: 1.year.from_now,
          image: blob.signed_id
        }
      }
    end

    it "has status :created" do
      post "/activities", params: params
      expect(flash[:notice]).to match("New activity has been added.")
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT #update" do
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
      { activity: 
        {
          title: "New Title",
          is_public: false,
          description: nil,
          deadline: 1.year.from_now,
          image: blob.signed_id
        }
      }
    end

    it "has status :ok" do
      put "/activities/#{activity.id}", params: params
      expect(flash[:notice]).to match("Activity has been updated.")
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE #destroy" do
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
      { activity: 
        {
          id: activity.id
        }
      }
    end

    it "has status :ok" do
      delete "/activities/#{activity.id}", params: params
      expect(flash[:notice]).to match("Activity has been deleted.")
      expect(response).to have_http_status(:ok)
    end
  end
end
