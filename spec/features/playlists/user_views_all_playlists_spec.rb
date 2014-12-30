require 'rails_helper'


  feature "a registered user views all playlist", %q(As a user
  I want to view all playlists
  So I can choose which ones to review

  Acceptance Criteria
  [X] I must see all titles on index
  [X] I must see user name associated with each playlist
  [X] I must be able to reach an individual playlists show page.
  [ ] I must see rating for each playlist (if available)
  [ ] I must see playlists sorted by rating (highest to lowest as default)
  [ ] I must be able to sort playlists by different parameters

) do

  scenario "views all playlists" do

    user1 = FactoryGirl.create(:user)
    playlist1 = FactoryGirl.create(:playlist, user_id: user1.id)
    user2 = FactoryGirl.create(:user)
    playlist2 = FactoryGirl.create(:playlist, user_id: user2.id)

    visit root_path

    expect(page).to have_content playlist1.title
    expect(page).to have_content playlist2.title
    expect(page).to have_content playlist1.user.email
    expect(page).to have_content playlist2.user.email

  end

  scenario "user views another users playlist" do

    user1 = FactoryGirl.create(:user)
    playlist1 = FactoryGirl.create(:playlist, user_id: user1.id)
    user2 = FactoryGirl.create(:user)
    playlist2 = FactoryGirl.create(:playlist, user_id: user2.id)

    visit root_path

    click_link playlist1.title

    expect(page).to have_content playlist1.title
    expect(page).to have_content playlist1.description
    expect(page).to have_content playlist1.url
    expect(page).to have_content playlist1.user.email
    expect(page).to_not have_content playlist2.title
  end
end
