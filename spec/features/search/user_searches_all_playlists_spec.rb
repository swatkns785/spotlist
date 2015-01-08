require 'rails_helper'

feature "User searches for a playlist", %q(

As a user
I want to be able to search for a playlist
So that I can listen to a specific playlist.

Acceptance Criteria

[ ] I must be able to search for a playlist from the navbar
[ ] I must only see results that match my input
[ ] If I do not find any playlists I must be notified that no matches were found


) do
  before :each do
    @playlist1 = FactoryGirl.create(:playlist, title: "Rap What")
    @playlist2 = FactoryGirl.create(:playlist, title: "per rap")
    @playlist3 = FactoryGirl.create(:playlist)
    @playlist4 = FactoryGirl.create(:playlist)
    @playlist5 = FactoryGirl.create(:playlist, description: "This rap is saucy. I never listened to saucy rap like this")
  end

  scenario "User searches for a playlist", focus: true do
    visit root_path
    fill_in "Search", with: "Rap"
    click_button "Search"

    expect(page).to have_link @playlist1.title
    expect(page).to have_link @playlist2.title
    expect(page).to have_link @playlist5.title
    expect(page).to_not have_link @playlist3.title
    expect(page).to_not have_link @playlist4.title
  end
end
