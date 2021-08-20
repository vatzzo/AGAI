FactoryBot.define do
  factory :user do
    email { "some_user@example.com" }
    password { "admin123" }
    is_admin { false }
    full_name { "John Doe" }
    location { "Cracow" }
    phone_number { 123456789 }
    biography { "Some Biography" }
    education { "Some Education" }
    profession { "Some Profession" }
    
    trait :admin do
      is_admin { true }
    end
  end
end
