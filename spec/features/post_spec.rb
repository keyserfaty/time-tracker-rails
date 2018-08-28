require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of post' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    it 'has a form that can be reached' do
      visit new_post_path # this is coming from the name of the routes
      expect(page.status_code).to eq(200)
    end

    it 'can be created from form page' do
      visit new_post_path

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on "Save"

      expect(page).to have_content("Some rationale")
    end
  end
end
