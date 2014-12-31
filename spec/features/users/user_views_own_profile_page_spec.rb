require 'rails_helper'

feature 'user views own profile page', %Q{
  As a user

  I want to view my user page
  So that I can admire myself
  Acceptance Criteria
  [ ] I must be able to get to my user page from anywhere in the app
  [ ] I must see my name, playlists (playlist names), avatars?
  [ ] I must see all of my playlists, along with most recent reviews
  [ ] I must see the functionality to delete account.
} do

  scenario 'user views profile page', focus: :true do

    user1 = FactoryGirl.create(:user)
    playlist1 = FactoryGirl.create(:playlist, user_id: user1.id)
    playlist2 = FactoryGirl.create(:playlist, user_id: user1.id)
    user2 = FactoryGirl.create(:user)
    playlist3 = FactoryGirl.create(:playlist, user_id: user2.id)

    visit new_user_session_path

    sign_in_as(user1)

    visit user_path

    expect(page).to have_content playlist1.title
    expect(page).to have_content playlist1.url
    expect(page).to have_content playlist2.title
    expect(page).to have_content playlist2.url
    expect(page).to_not have_content playlist3.title


  end

end
