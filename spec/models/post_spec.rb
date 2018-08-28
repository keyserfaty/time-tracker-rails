require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      @post = Post.create(date: Date.today, rationale: "Anything")
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without date and rationale" do
      @post.date = nil
      @post.rationale = nil

      expect(@post).to_not be_valid
    end
  end

  describe 'creation' do
    it 'has a form that can be reached' do
      visit new_post_path # this is coming from the name of the routes
      expect(page.status_code).to eq(200)
    end
  end
end
