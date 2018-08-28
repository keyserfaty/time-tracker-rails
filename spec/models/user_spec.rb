require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    it "can be created" do
      user = User.create(email: 'test@test.com', password: 'asdfgh', password_confirmation: 'asdfgh')
      expect(user).to be_valid
    end
  end
end
