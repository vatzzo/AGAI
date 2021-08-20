require 'rails_helper'

RSpec.describe Step, type: :model do
  describe "when initialized" do
    subject { build(:step) }

    context "associations" do
      it { should belong_to(:activity).class_name('Activity') }
    end

    context "validations" do
      it { should have_rich_text(:content) }
      it { should validate_presence_of(:title) }
      it { should validate_length_of(:title).is_at_least(3) }
      it do
        should validate_inclusion_of(:is_done).
          in_array([true, false])
      end
    end
  end
end
