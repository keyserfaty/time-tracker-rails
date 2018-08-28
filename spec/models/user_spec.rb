require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: 'test@test.com', password: 'asdfgh', password_confirmation: 'asdfgh', first_name: "Jon", last_name: "Snow")
  end
  
  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created with first_name last_name" do
      @user.first_name = nil
      @user.last_name = nil

      expect(@user).to_not be_valid
    end
  end

  describe "custom name methods" do
    it 'has a fullname method that combines first and last' do
      expect(@user.full_name).to eq("Jon Snow")
    end
  end
end
