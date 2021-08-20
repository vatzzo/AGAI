require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe "when initialized" do
    subject { build(:rating) }

    context "associations" do
      it { should belong_to(:user).class_name('User') }
    end

    context "validations" do
      it { should validate_presence_of(:grade) }
      it do
        should validate_inclusion_of(:grade).
          in_array((1..5).to_a)
      end
    end
  end
end
