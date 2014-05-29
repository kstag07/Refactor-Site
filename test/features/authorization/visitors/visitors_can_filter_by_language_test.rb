require "test_helper"

feature "Vistor has certain capabilities" do
  scenario "As a Visitor, I can filter to see a single language." do

    #Given that I am not signed in,

    #When when I visit the posts index,
    visit posts_path
    page.must_have_content posts(:ruby_post).title
    page.must_have_content posts(:js_post).title
    # save_and_open_page
    # and select a language from the pull-down,
    select('Ruby', :from => 'filter')
    # find('#filter').find(:xpath, 'option[6]').select_option
    click_on 'Filter'

    #Then only posts with the selected language should be visible.
    page.must_have_content posts(:ruby_post).title
    page.wont_have_content posts(:js_post).title
  end
end
