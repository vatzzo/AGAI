require 'rails_helper'

RSpec.describe User, type: :model do
  describe "when initialized" do
    subject { build(:user) }
    before do
      subject.avatar.attach(
        io: File.open(Rails.root.join('spec', 'assets', 'cooking-min.jpg')),
        filename: 'cooking-min.jpg'
      )
    end

    context "associations" do
      it { should have_many(:activities) }
      it { should have_many(:comments) }
      it { should have_many(:ratings) }
    end

    context "validations" do
      it { should have_one_attached(:avatar) }
      it { should validate_numericality_of(:phone_number) }
    end
  end
end
