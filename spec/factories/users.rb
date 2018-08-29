FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    email { generate(:email) }
    password { 'asdfgh' }
    password_confirmation { 'asdfgh' }
    id { 1 }
  end

  factory :admin_user, class: User do
    first_name { "Admin" }
    last_name { "User" }
    email { generate(:email) }
    password { 'asdfgh' }
    password_confirmation { 'asdfgh' }
    type { 'AdminUser' }
    id { 2 }
  end

  factory :non_auth_user, class: User do
    first_name { "Non" }
    last_name { "Auth" }
    email { generate(:email) }
    password { 'asdfgh' }
    password_confirmation { 'asdfgh' }
    id { 3 }
  end
end