require "test_helper"

feature "Author has certain capabilities" do
  scenario "As an Author, I want to update my own posts" do

    # Given an existing post
    sign_in(:author_user)
    visit post_path(posts(:cr))

    # When I click Edit and Update the post,
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    # Then the post is updated.
    page.text.must_include "Post was successfully updated."
    page.text.must_include "Web Developer"
    page.wont_have_content posts(:cr).title

  end
end
