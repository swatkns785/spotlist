require 'rails_helper'

feature "Admin deletes a user", %q(
As an admin
I want to be able to delete a user
So that I can clean up our database

Acceptance Criteria
[ ] I must be able to delete a specific user from our service
[ ] All playlist associated with that user must be deleted as well
[ ] All reviews associated with the user must be deleted
) do

  scenario "Admin deletes a user" do
    admin_user = FactoryGirl.create(:user, admin: true)
    non_admin_user = FactoryGirl.create(:review)

    sign_in_as(admin_user)
    visit admin_users_path
    expect(page).to have_content non_admin_user.email

    click_link "Delete User"
    expect(page).to_not have_content non_admin_user.email
  end
end
