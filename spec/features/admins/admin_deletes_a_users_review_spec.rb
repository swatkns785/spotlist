require 'rails_helper'

feature "Admin deletes a users review", %q(
As an admin
I must be able to delete a review
So that I can monitor explicit language and emoticons
Acceptance Criteria
[x] I must be able to delete a review from a playlist
[ ] User that submitted the review will receive an email warning

) do

  scenario "Admin deletes a users review" do
    admin_user = FactoryGirl.create(:user, admin: true)
    non_admin_user = FactoryGirl.create(:review)

    sign_in_as(admin_user)
    visit playlist_path(non_admin_user.playlist)

    expect(page).to have_content non_admin_user.description
    click_link "Delete Review"

    expect(page).to_not have_content non_admin_user.description
  end

end
