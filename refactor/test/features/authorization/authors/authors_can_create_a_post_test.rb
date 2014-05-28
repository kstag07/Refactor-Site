require "test_helper"

feature "As a user, I want to be the only editor of my posts" do
  scenario "Only authors can edit their posts" do
    sign_in(:author_user)
    visit new_post_path
    fill_in 'Title', with: 'Test author title'
    fill_in 'Body', with: 'Test author body'
    click_on 'Create Post'

    visit posts_path
    page.text.must_include 'Edit'

    click_on 'Sign out'
    page.text.wont_include 'Edit'
  end
end
