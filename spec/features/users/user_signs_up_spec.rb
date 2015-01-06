require 'rails_helper'

feature 'user registers', %Q{
  As a visitor
  I want to register
  So that I can create an account
} do

  scenario 'provide valid registration information' do
    visit new_user_registration_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    attach_file('Add a Photo', 'app/assets/images/William_Mahoney.jpg')

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')

    user = User.last
    click_link 'Profile'
    expect(page).to have_xpath("//img[@src=\"/uploads/user/profile_photo/#{user.id}/William_Mahoney.jpg\"]")
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end
end
