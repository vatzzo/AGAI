require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "when initialized" do
    subject { build(:comment) }

    context "associations" do
      it { should belong_to(:user).class_name('User') }
    end

    context "validations" do
      it { should validate_presence_of(:content) }
    end
  end
end
