require 'test_helper'

feature 'As an Author I want to to be able to see my name on my posts' do
  scenario "Author's username is visible on new posts in the index" do
    sign_in(:author_user)
    visit root_path
    click_on "New Post"
    fill_in "Title", with: "Postalot"
    fill_in "Body", with: "Lotsofstuff"
    click_on "Create Post"
    page.body.must_include users(:author_user).name
    click_on "Back"
    page.body.must_include users(:author_user).name
  end

  scenario "Author's username is visible on posts in the index" do
    sign_in(:author_user)
    visit root_path
    click_on "New Post"
    fill_in "Title", with: "Postalot"
    fill_in "Body", with: "Lotsofstuff"
    click_on "Create Post"
    page.body.must_include users(:author_user).name
  end

  scenario "Visitor can see author of posts on Index"do
    visit root_path
    page.text.must_include users(:author_user).name
  end

  scenario "Visitor can see author of post on Show page" do
    visit posts_path
    click_on posts(:test_post).title
    page.text.must_include users(:author_user).name
  end
end
