require 'rails_helper'

feature "user visits own page", %q(
As a user
I want to view my user page
So that I can admire myself
Acceptance Criteria
[ x ] I must be able to get to my user page from anywhere in the app
[ x ] I must see my name, playlists (playlist names)
[ ] I must see all of my playlists, along with most recent reviews
[ ] I must see the functionality to delete account.
) do

  scenario "user can visit own page and see their playlists" do

    playlist = FactoryGirl.create(:playlist)

    sign_in_as(playlist.user)
    click_on "Profile"

    expect(page).to have_content playlist.user.email
    expect(page).to have_content playlist.title
  end

  scenario "user can visit own page and see their recent reviews" do

  #user creates a review on another user's playlist
  #user visits own profile page and sees their review

  playlist2 = FactoryGirl.create(:playlist)
  sign_in_as(playlist2.user)

  visit playlists_path
  expect(page).to have_content playlist2.user.email
  click_on playlist2.title

  select "2", from: "Rating"
  fill_in "Description", with: "This is a really really really good playlist........."

  click_on "Submit Review"
  end
end
