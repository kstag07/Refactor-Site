require "test_helper"

feature "Vistor has certain capabilities" do
  scenario "As a Visitor, I can see a post that is not mine." do

    #Given that I am not signed in,

    #When visitor visits the 'show' page
    visit posts_path

    #Then only the published post should be visible
    page.must_have_content posts(:test_post).title
  end

  scenario "As as Visitor, clicking Create Post takes me to Sign_in." do
    #Given that I am not signed in,

    #When I visit the posts page,
    visit posts_path
save_and_open_page
    click_on "New Post"

    #Then I will be redirected to the User Sign-in page.
    assert_redirected_to user_session_path
  end

  # scenario "As a Visitor, I cannot type a URL and get access to new posts page" do
  #   #Given that I am not signed in,

  #   #When I visit the posts page,
  #   visit posts_path

  #   # and I cannot get access to a New Post page.
  #   assert_redirected_to posts_path
  # end
end

