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

    #Then I will be redirected to the User Sign-in page.
    page.text.must_include("Sign in")
  end

  scenario "As as Visitor, clicking Post a Refactor takes me to Sign_in." do
    #Given that I am not signed in,

    #When I visit the posts page,
    visit posts_path

    click_on "Post a refactor"

    #Then I will be redirected to the User Sign-in page.
    page.text.must_include("Sign in")
  end

end

