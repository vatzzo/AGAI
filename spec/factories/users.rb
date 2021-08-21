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

    factory :second_user do
      email { "second_user@example.com" }
      password { "admin123" }
      is_admin { false }
    end

    factory :admin do
      email { "admin_user@example.com" }
      password { "admin123" }
      is_admin { true }

      after :create do |u|
        create :comment, user: u
      end
    end
  end
end
