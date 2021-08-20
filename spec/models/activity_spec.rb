require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe "when initialized" do
    subject { build(:activity) }
    before do
      subject.image.attach(
        io: File.open(Rails.root.join('spec', 'assets', 'cooking-min.jpg')),
        filename: 'cooking-min.jpg'
      )
    end

    context "associations" do
      it { should belong_to(:user).class_name('User') }
      it { should have_many(:steps) }
    end

    context "validations" do
      it { should have_one_attached(:image) }
      it { should have_rich_text(:description) }
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:deadline) }
      it { should validate_length_of(:title).is_at_least(3) }
      it do
        should validate_inclusion_of(:is_public).
          in_array([true, false])
      end
    end
  end
end
