require 'test_helper'

feature 'As an Author I want to to be able select the code language' do
  scenario "Author's username is visible on posts in the index" do
    sign_in(:author_user)
    visit root_path
    click_on "New Post"
    fill_in "Title", with: posts(:post_by_author).title
    fill_in "Body", with: posts(:post_by_author).body
    find('#post_language').find(:xpath, 'option[2]').select_option
    # fill_in "language", with: "C++"
    click_on "Create Post"
    page.text.must_include "C++"
    save_and_open_page
    click_on "Back"
    page.text.must_include "C++"
  end

end
