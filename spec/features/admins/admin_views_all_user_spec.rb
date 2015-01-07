require 'rails_helper'

feature "Admin views all users", %q(
As an admin
I want to be able to see a full list of users
So that I can update users if needed

Acceptance Criteria
[x] I must be able to view a full list of users
[x] A non-admin user must not be able to view this page
[ ] I must be able to search for a specific user
[ ] I must be able to sort all users by name or date created


) do

  scenario "Admin views all users" do
    admin_user = FactoryGirl.create(:user, admin: true)
    non_admin_user1 = FactoryGirl.create(:playlist)
    non_admin_user2 = FactoryGirl.create(:playlist)

    sign_in_as(admin_user)

    click_link "Admin"
    expect(page).to have_content non_admin_user1.user.email
    expect(page).to have_content non_admin_user2.user.email
  end

  scenario "Non admin cannot view admin page" do
    FactoryGirl.create(:user, admin: true)
    non_admin_user = FactoryGirl.create(:user)

    sign_in_as(non_admin_user)
    expect(page).to_not have_content "Admin"

    visit admin_users_path
    expect(page).to have_content "You are not authorized to access this page."
  end
end
