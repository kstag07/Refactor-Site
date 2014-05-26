require "test_helper"

feature "Vistor has certain capabilities" do
  scenario "As a Visitor, I can see all posts." do

    #Given that I am not signed in,

    #When visitor visits the 'show' page
    visit posts_path

    #Then only the published post should be visible
    page.must_have_content posts(:test_post).title
  end

  scenario "As as Visitor, I cannot see a link to create new posts." do
    #Given that I am not signed in,

    #When I visit the posts page,
    visit posts_path


    #Then I cannot see a link to create new posts,
    page.wont_have_link "New Post"

  end

  # scenario "As a Visitor, I cannot type a URL and get access to new posts page" do
  #   #Given that I am not signed in,

  #   #When I visit the posts page,
  #   visit posts_path

  #   # and I cannot get access to a New Post page.
  #   assert_redirected_to posts_path
  # end
end

