require "rails_helper"

feature "a user deletes a playlist", %q(

As a user
I want to delete one of my own playlists
So that no one can see my playlist

Acceptance Criteria
[x] I must be able to delete my playlist from the individual playlist page
[x] I must not be able to delete someone else's playlist
) do

  scenario "a user deletes a playlist successfully" do

    playlist = FactoryGirl.create(:playlist)

    sign_in_as(playlist.user)

    click_link playlist.title

    expect(page).to have_link "Delete Playlist"
    click_link "Delete Playlist"
    expect(page).to have_content "Your playlist has been successfully deleted."
    expect(page).to_not have_content playlist.title

  end

  scenario "a user tries to delete another user's playlist" do

    playlist1 = FactoryGirl.create(:playlist)
    playlist2 = FactoryGirl.create(:playlist)

    sign_in_as(playlist1.user)

    visit playlist_path(playlist2)

    expect(page).to_not have_content "Delete Playlist"

  end

end
