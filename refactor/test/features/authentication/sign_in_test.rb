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
end
