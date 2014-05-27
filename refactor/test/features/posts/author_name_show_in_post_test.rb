require 'test_helper'

feature 'As an Author I wanto to be able to see my name on my posts' do
  scenario "Author's username is visible on posts in the index" do
    sign_in(:author_user)
    visit root_path
    click_on "New Post"
    fill_in "Title", with: "Postalot"
    fill_in "Body", with: "Lotsofstuff"
    click_on "Create Post"
    page.text.must_include "Posted by: #{users(:author_user).name}"
    click_on "Back"
    page.text.must_include "Posted by: #{users(:author_user).name}"
  end

  scenario "Author's username is visible on posts in the index" do
    sign_in(:author_user)
    visit root_path
    click_on "New Post"
    fill_in "Title", with: "Postalot"
    fill_in "Body", with: "Lotsofstuff"
    click_on "Create Post"
    page.text.must_include "Posted by: #{users(:author_user).name}"
  end
end
