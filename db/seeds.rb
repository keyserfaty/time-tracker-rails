100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content")
end

p "100 posts created"