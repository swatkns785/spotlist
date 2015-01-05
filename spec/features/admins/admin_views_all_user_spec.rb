require 'rails_helper'

feature "Admin views all users", %q{
As an admin
I want to be able to see a full list of users
So that I can update users if needed

Acceptance Criteria
[  ] I must be able to view a full list of users
[  ] I must be able to search for a specific user
[  ] I must be able to sort all users by name or date created


} do

  scenario "Admin views all users", focus: true do
    Factorygirl.create(:user, admin: true)

    vitis admin_path
  end

end
