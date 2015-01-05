require 'rails_helper'

feature "user visits own page", %q(
As a user
I want to view my user page
So that I can admire myself
Acceptance Criteria
[ x ] I must be able to get to my user page from anywhere in the app
[ x ] I must see my name, playlists (playlist names)
[ x ] I must see all of my playlists, along with most recent reviews
) do

  scenario "user can visit own page and see their playlists" do

    playlist = FactoryGirl.create(:playlist)

    sign_in_as(playlist.user)
    click_on "Profile"

    expect(page).to have_content playlist.user.email
    expect(page).to have_content playlist.title
  end

  scenario "user can visit own page and see their recent reviews" do

  review = FactoryGirl.create(:review)

  sign_in_as(review.user)

  visit user_path(review.user)
  expect(page).to have_content review.description
  end

  scenario "user can visit own page and see their profile picture" do

    user = FactoryGirl.create(:user)

    sign_in_as(user)
    click_on "Profile"

    expect(page).to have_xpath("//img[@src=\"/uploads/user/profile_photo/#{user.id}/William_Mahoney.jpg\"]")
  end
end
