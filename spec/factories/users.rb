FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    email { 'test@test.com' }
    password { 'asdfgh' }
    password_confirmation { 'asdfgh' }
    id { 1 }
  end

  factory :admin, class: User do
    first_name { "Admin" }
    last_name { "User" }
    email { 'test@test.com' }
    password { 'asdfgh' }
    password_confirmation { 'asdfgh' }
    id { 2 }
  end
end