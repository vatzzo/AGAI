FactoryBot.define do
  factory :rating do
    grade { [1..5].sample }
    
    association :ratingable, factory: :activity
  end
end