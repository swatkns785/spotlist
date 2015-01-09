require 'rails_helper'

feature "User searches for a playlist", %q(

As a user
I want to be able to search for a playlist
So that I can listen to a specific playlist.

Acceptance Criteria

[x] I must be able to search for a playlist from the navbar
[x] I must only see results that match my input
) do

  before :each do
    @playlist1 = FactoryGirl.create(:playlist, title: "Rap What")
    @playlist2 = FactoryGirl.create(:playlist, title: "per rap")
    @playlist3 = FactoryGirl.create(:playlist)
    @playlist4 = FactoryGirl.create(:playlist)
    @playlist5 = FactoryGirl.create(:playlist, description: "This rap is saucy. I never listened to saucy rap like this")
  end

  scenario "User searches for a playlist" do
    visit root_path
    fill_in "query", with: "Rap"
    click_button "Search"

    expect(page).to have_link @playlist1.title
    expect(page).to have_link @playlist2.title
    expect(page).to have_link @playlist5.title
    expect(page).to have_link @playlist3.title
    expect(page).to have_link @playlist4.title
  end
end
