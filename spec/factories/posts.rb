FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale  { "Some content" }
    user_id { 1 }
  end

  factory :post_2, class: Post do
    date { Date.yesterday }
    rationale  { "Some other content" }
    user_id { 1 }
  end
end