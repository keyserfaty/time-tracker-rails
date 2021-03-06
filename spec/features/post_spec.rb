require 'rails_helper'

describe 'navigate' do
  before do
    @user = create(:user)
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
      post1 = create(:post)
      post2 = create(:post_2)
      
      visit posts_path

      expect(page).to have_content(/Some content|Some other content/)
    end

    it 'has a delete button' do
      post = create(:post)
      
      visit posts_path

      click_link("delete_post_#{post.id}")

      expect(page.status_code).to eq(200)
    end
  end

  describe 'root' do
    it 'has a creation button' do
      visit root_path
      click_on "Create new"

      expect(page).to have_content("Create")
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
      fill_in 'post[rationale]', with: "Some content"

      click_on "Save"

      expect(page).to have_content("Some content")
    end

    it 'will have user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User_Association"

      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User_Association")
    end

    describe "edition" do
      before do
        @post = create(:post)
      end
      
      it "can be reached by clickin edit" do
        visit posts_path
        click_link("post_#{@post.id}")

        expect(page.status_code).to eq(200)
      end

      it "can be edited" do
        visit edit_post_path(@post)

        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "Some updated content"

        click_on 'Save'

        expect(page).to have_content("Some updated content")
      end

      it "cannot be edited by a non authorized user" do
        logout(:user)
        non_auth_user = create(:non_auth_user)
        login_as(non_auth_user, :scope => :user)

        visit edit_post_path(@post)

        expect(current_path).to eq(root_path)  
      end
      
    end
  end
end
