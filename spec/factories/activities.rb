FactoryBot.define do
  factory :activity do
    title { "Activity Title" }
    description { nil }
    is_public { [true, false].sample }
    deadline { 2.years.from_now }
    
    association :user
  end
end 