require 'test_helper'

feature "As a visitor I want to be able to click on an author on the index page and go to their user page" do
  scenario "author link takes you to user page" do
    visit posts_path

    click_on 'moderator'

  save_and_open_page
    page.text.must_include posts(:post_by_mod).title
    page.text.wont_include posts(:post_by_author).title
  end
end
