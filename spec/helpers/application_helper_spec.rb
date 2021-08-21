require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#role" do
    let(:normal_user) { create(:user) }

    it "returns user" do
      helper.role(normal_user).should eq("user")
    end
  end

  describe "#trim_title" do
    context "title is too long" do
      let(:title) { "It is more than 16 characters" }

      it "returns shortened title" do
        helper.trim_title(title).should eq("It is more than ...")
      end
    end

    context "title is long enough" do
      let(:title) { "Length is ok" }

      it "returns normal title" do
        helper.trim_title(title).should eq("Length is ok")
      end
    end
  end
end
