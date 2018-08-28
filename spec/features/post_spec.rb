require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: 'test@test.com', password: 'asdfgh', password_confirmation: 'asdfgh', first_name: 'Jon', last_name: 'Snow')
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path  # this is coming from the name of the routes
    end
    
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end
    
    it 'has a title of post' do
      expect(page).to have_content(/Time entries/)
    end
    
    it 'has a list of posts' do
      post1 = Post.create(date: Date.today, rationale: "Post1", user_id: @user[:id])
      post2 = Post.create(date: Date.today, rationale: "Post2", user_id: @user[:id])
      p post1
      
      visit posts_path

      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path # this is coming from the name of the routes
    end

    it 'has a form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on "Save"

      expect(page).to have_content("Some rationale")
    end

    it 'will have user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User_Association"

      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User_Association")
    end
  end
end
