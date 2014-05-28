require 'test_helper'

feature "As a visitor I want to be able to search for a a varities of features on the index" do
  scenario 'searching for a post' do
    visit posts_path
    fill_in "Search Posts", with: "author"
    click_on "Search"
    page.text.must_include "author"
    save_and_open_page
    page.text.wont_include "moderator"
  end

  scenario 'searching for a name' do
    visit posts_path
    fill_in "Search Posts"
  end
end

