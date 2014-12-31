require 'rails_helper'

feature "user visits own page", %q(
As a user
I want to view my user page
So that I can admire myself
Acceptance Criteria
[ ] I must be able to get to my user page from anywhere in the app
[ ] I must see my name, playlists (playlist names), avatars?
[ ] I must see all of my playlists, along with most recent reviews
[ ] I must see the functionality to delete account.
) do

  scenario "user can visit own page" do
    user = FactoryGirl.create(:user)
    
    sign_in_as(user)

    visit user_path

    expect(page).to have_content user.email
  end
end
