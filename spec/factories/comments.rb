FactoryBot.define do
  factory :comment do
    content { "Comment Content" }
    
    association :commentable, factory: :user
  end
end