@user = User.create(email: 'test@test.com', password: 'asdfgh', password_confirmation: 'asdfgh', first_name: 'Jon', last_name: 'Snow')

p "1 user created"

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

p "100 posts created"