require "test_helper"

feature "As a user, I want to be able to contribute by making posts" do
  scenario "An author can create a post." do
    sign_in(:author_user)
    new_post_title = "a new post"
    new_post_body = "body of new post"

    visit new_post_path
    fill_in 'Title', with: new_post_title
    fill_in 'Body', with: new_post_body
    click_on 'Create Post'

    page.text.must_include new_post_title
    page.text.must_include new_post_body
  end
end
