require "test_helper"

feature "As an author I want to add comments to a post so I can improve other's code" do
  scenario "Creating a comment" do
    sign_in(:author_user)
    visit root_path
    click_on posts(:test_post).title
    fill_in "Content", with: "This is a comment"
    click_button "Add Refactor"
    page.text.must_include "Refactor was successfully submitted"
    page.text.must_include " This is a comment"
  end
end
