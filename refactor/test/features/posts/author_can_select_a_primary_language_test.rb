require 'test_helper'

feature 'As an Author I want to to be able select the code language' do
  scenario "Author's username is visible on posts in the index" do
    # Given that I am a signed-in author of a new post
    sign_in(:author_user)
    visit root_path
    click_on "New Post"
    fill_in "Title", with: posts(:post_by_author).title
    fill_in "Body", with: posts(:post_by_author).body

    #  When I select the applicable programming language,
    select('C++', :from => 'post_language')
    #  and create the post,
    click_on "Create Post"

    # Then I can see the language in the Show view
    page.text.must_include "C++"

    # and in the Index view.
    click_on "Back"
    page.text.must_include "C++"
  end
end
