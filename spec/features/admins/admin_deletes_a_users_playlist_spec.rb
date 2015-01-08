require 'rails_helper'

feature 'Admin deletes a users playlist', %q(
As an admin
I want to be able to delete a playlist
So that I can monitor explicit material

Acceptance Criteria
[x] I must be able to delete a specific playlist
[x] Any reviews associated with the playlist must be deleted

) do

  scenario "Admin deletes a users playlist" do
    admin_user = FactoryGirl.create(:user, admin: true)
    non_admin_user = FactoryGirl.create(:playlist)

    sign_in_as(admin_user)
    visit playlist_path(non_admin_user)

    expect(page).to have_content 'Delete Playlist'
    expect(page).to_not have_content 'Edit Playlist'

    click_link 'Delete Playlist'
    expect(page).to have_content "Your playlist has been successfully deleted."
  end
end
