require 'test_helper'

feature "As a visitor I want to be able to search for a a varities of features on the index" do
  scenario 'searching for a post' do
    visit posts_path
    fill_in "Search Posts", with: "author"
    click_on "Search"
    page.text.must_include "author"
    page.text.wont_include "moderator"
  end
end

