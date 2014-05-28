require 'test_helper'

feature 'As a site owner I want visitors to see that they can add refactors to a post so they know our features but cannnot modify them without logging in' do
    scenario 'Visitors are redirected when creating a new post' do
      visit root_path
      click_on 'Testing'
      fill_in 'Content', with: 'Something'
      click_on 'Add Refactor'
      page.text.must_include 'You need to sign in or sign up before continuing'
    end

    scenario 'Visitors can see comments but not edit or destroy them' do
      visit posts_path
      click_on posts(:test_post).title
      page.text.must_include comments(:rf).content
      page.text.wont_include 'Edit'
      page.text.wont_include 'Destroy'
    end
  end
