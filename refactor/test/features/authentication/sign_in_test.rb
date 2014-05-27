require "test_helper"

feature "As a user, I want to sign into my account to access my settings and posts" do
  scenario "Sign in" do
    visit new_user_session_path
    fill_in "Email", with: users(role).email
    fill_in "Password", with: 'password'
    click_button "Sign in"
    sign_in(:author)
    page.must_have_content "Signed in successfully"
  end

  scenario "sign in with twitter works" do
    visit root_path
    click_on "Sign In"
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
    click_on "Sign in with Twitter"
    save_and_open_page
    page.must_have_content "test_twitter_user, you are signed in!"
    # Courtesy of: https://gist.github.com/ivanoats/7071730
    # with help from https://github.com/intridea/omniauth/wiki/Integration-Testing
  end
end
