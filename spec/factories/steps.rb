FactoryBot.define do
  factory :step do
    title { 'Step Tile' }
    content { nil }
    is_done { [true, false].sample }

    association :activity
  end
end