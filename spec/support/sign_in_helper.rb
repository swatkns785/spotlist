def sign_in
  user = FactoryGirl.create(:user)
  visit root_path
  click_link "Sign In"
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Log in"
  expect(page).to have_content "You have been successfully signed in."
end
