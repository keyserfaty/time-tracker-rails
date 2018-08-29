require 'rails_helper'

describe "navigate" do
  before do
    @admin_user = create(:admin_user)
    @user = create(:user)
    login_as(@admin_user, :scope => :user)
  end
  
  describe "edit" do
    before do
      @post = create(:post)
      @post_3 = create(:post_3)
      visit edit_post_path(@post)
    end
    
    it "has a status that can be edited from the form by an admin" do
      choose('post_status_approved')
      click_on 'Save'

      expect(@post.reload.status).to eq('approved')
    end

    it "can not be editted by a non admin" do
      logout(:user)

      login_as(@user, :scope => :user)

      visit edit_post_path(@post)

      expect(page).to_not have_content('Approved')
    end
  end
end
