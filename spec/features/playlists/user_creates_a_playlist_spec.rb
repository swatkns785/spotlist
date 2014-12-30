require 'rails_helper'


feature "a registered user shares a playlist", %q(
As a registered user
I want to share one of my Spotify playlists
So that I can see if I have good music tastes

Acceptance Criteria
[ ] I must be able to share a playlist from any page
[ ] I must be presented with errors if the form is filled out incorrectly
[ ] I must provide the title, URL, and description
) do

  context "user successfully adds playlist" do

    scenario "user successfully add playlist, meeting all acceptance criteria" do

      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
      expect(page).to have_content "Signed in successfully."

      playlist = FactoryGirl.create(:playlist, user_id: user.id)

      click_link "Add a playlist"

      expect(page).to have_content "Fill out the form below to add your playlist"
      fill_in "Title", with: playlist.title
      fill_in "URL", with: playlist.url
      fill_in "Description", with: playlist.description
      click_button "Submit Playlist"

      expect(page).to have_content "Your playlist has been successfully added."
      expect(page).to have_content playlist.title
      expect(page).to have_content playlist.url
      expect(page).to have_content playlist.description
      expect(page).to have_content playlist.user.email

    end

  end

end
