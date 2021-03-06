require 'test_helper'

feature 'As a author I want to be able to edit my own comments so that I can change things I messed up'  do
  scenario 'Editing a comment' do
    sign_in(:author_user)
    visit root_path
    click_on 'Testing'
    click_on "Edit Refactor"
    fill_in "Content", with: "New comment"
    click_on "Add Refactor"
    page.text.must_include "New comment"
  end

  scenario "visitors cannot edit" do
    visit root_path
    click_on posts(:test_post).title
    page.text.wont_include "Edit"
  end

end
