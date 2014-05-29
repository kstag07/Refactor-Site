require 'test_helper'

feature 'As a an author I want the comments I worked on to show' do
  scenario "seeing who posted comments" do
    sign_in(:author_user)
    visit posts_path
    click_on 'Test title by moderator'
    fill_in "Content", with: "blarg"
    click_on "Add Refactor"
    page.text.must_include "Author: #{users(:author_user).name}"
  end
end
