require "test_helper"

feature "As an author I want to add comments to a post so I can improve other's code" do
  scenario "Creating a comment" do
    sign_in(:author)
    visit root_path
    click_on "Show"
    fill_in "Content", with: "This is a comment"
    click_button "Create comment"
    page.text.must_include "Comment Successfully committed"
    page.text.must_include " This is a comment"
    page.text.must_include "email@example.com"
  end
end
