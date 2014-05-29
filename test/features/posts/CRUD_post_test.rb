require 'test_helper'

feature 'As an author I want to be able to delete my own post' do
  scenario "post is deleted by the author" do
    # Given I am an author with an existing post
    sign_in(:author_user)
    post = posts(:post_by_author)
    # and I visit the show page for that post,
    visit post_path(post)

    # When I delete a post as an editor
    title = post.title
    click_on "Destroy Post"

    # Then the post will be deleted, and not appear in the Index
    page.wont_have_content title
  end

  scenario "a visitor can't create, edit or delete posts" do
    visit root_path
    page.wont_have_content "Destroy"
    page.wont_have_content "Edit"
    click_on "New Post"
    page.text.must_include "You need to sign in or sign up before continuing."
  end
end
