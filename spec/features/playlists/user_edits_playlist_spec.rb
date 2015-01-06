require 'rails_helper'

feature "user edits a playlist", %q(
As a registered user
I want to edit one of my playlists
So that I can add, remove, or modify songs on my playlist

Acceptance Criteria
[x] I must be able to edit the playlist from the unique playlist page
[x] I must be able to update the description of the playlist
[x] I must be able to update the title of the playlist
[x] I must be presented with errors if I make a mistake with the description or URL.
[x] I must not be able to edit someone else's playlist.
) do

  scenario "user edits playlist, meeting all acceptance criteria" do

    playlist = FactoryGirl.create(:playlist)

    sign_in_as(playlist.user)

    click_link playlist.title

    expect(page).to have_content playlist.title
    expect(page).to have_link "Edit Playlist"

    click_link "Edit Playlist"

    fill_in "Title", with: "#{playlist.title} 12345"
    fill_in "URL", with: "#{playlist.url}12345"
    fill_in "Description", with: "#{playlist.description} 12345"
    click_button "Update Playlist"

    expect(page).to have_content "#{playlist.title} 12345"
    expect(page).to have_content "#{playlist.url}12345"
    expect(page).to have_content "#{playlist.description} 12345"
  end

  scenario "user fills out URL field incorrectly" do

    playlist = FactoryGirl.create(:playlist)

    sign_in_as(playlist.user)
    visit edit_playlist_path(playlist)
    fill_in "URL", with: "wrongurl"
    click_button "Update Playlist"
    
    expect(page).to have_content "Url is invalid"
    expect(page).to_not have_content "Your playlist has been successfully updated."

  end

  scenario "user fills out description field incorrectly" do

    playlist = FactoryGirl.create(:playlist)

    sign_in_as(playlist.user)
    visit edit_playlist_path(playlist)
    fill_in "Description", with: "x"*301
    click_button "Update Playlist"

    expect(page).to have_content "Description is too long (maximum is 300 characters)"
    expect(page).to_not have_content "Your playlist has been successfully updated."

  end

  scenario "user unsuccessfully tries to edit another user's playlist" do

    playlist1 = FactoryGirl.create(:playlist)
    playlist2 = FactoryGirl.create(:playlist)

    sign_in_as(playlist1.user)

    visit playlist_path(playlist2)

    expect(page).to_not have_content "Edit Playlist"

  end

end
