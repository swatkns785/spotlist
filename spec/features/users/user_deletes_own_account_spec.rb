require 'rails_helper'

feature "user deletes own account", %q(
As a user
I want to visit my profile page
So that I can delete my account

Acceptance Criteria
[ x ] I must  be able to delete my account from my profile page.
[ x ] I must see a message that I have successfully deleted my account
[ x ] I cannot delete someone else's profile
) do

  scenario "user can visit their profile page and delete their account" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    click_on "Profile"
    click_on "Delete Account"

    expect(page).to have_content "You have canceled your account with Spotlist"
  end

  scenario "user visits another user's account and cannot delete that account" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)

    sign_in_as(user)
    visit user_path(user2.id)

    expect(page).to_not have_button "Delete Account"
    end
end
