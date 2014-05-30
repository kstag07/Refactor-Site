require "test_helper"

feature "Author has certain capabilities" do
  scenario "As an Author, I want to update my own posts" do

    # Given I have author credentials,
    sign_in(:author_user)
    # and I visit the edit page,
    post = posts(:post_by_author)
    visit post_path post

    # When I click Edit and Update the post,
    click_on "Edit"

    fill_in "post_title", with: "My better title"
    click_on "Submit"

    # Then the post is updated.
    #page.text.must_include "Post was successfully updated."
    page.text.must_include "My better title"
    page.wont_have_content posts(:post_by_author).title

  end

  scenario "As an Author, I cannot update someone elses post." do

    # # Given I have author credentials,
    sign_in(:author_user)

    # When I visit a post by someone else,
    post = posts(:post_by_mod)
    visit post_path post

    # Then I cannot see an Edit button

    # and I cannot see a Destroy button.
  end

end
