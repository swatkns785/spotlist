require 'rails_helper'

feature "user deletes own review", %q(
As a user
I want to delete my own review on someone else's playlist
So that they wont be offended by my negative commentary

Acceptance Criteria
[x] I must be able to delete my review from the playlist owners user page
[x] I must be able to delete my review from the playlist's show page
[x] I must not be able to delete any one else's reviews

) do

  scenario "user successfully deletes own review from playlist" do

    user = FactoryGirl.create(:user)
    playlist = FactoryGirl.create(:playlist, user_id: user.id)
    review = FactoryGirl.create(:review, playlist_id: playlist.id, user_id: user.id)

    sign_in_as(user)

    visit playlist_path(playlist)
    click_on "Delete Review"
    expect(page).to_not have_content (review.description)
  end

  scenario "user cannot delete anothor's user reviews" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    playlist = FactoryGirl.create(:playlist, user_id: user.id)
    FactoryGirl.create(:review, playlist_id: playlist.id, user_id: user.id)

    sign_in_as(user2)

    visit playlist_path(playlist)

    expect(page).to_not have_content "Delete Review"
  end
end
