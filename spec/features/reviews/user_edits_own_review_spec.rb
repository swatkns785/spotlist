require "rails_helper"

feature "user edits own review", %q(
As a user
I want to edit my review of someone else's playlist
So that I can correct my spelling errors
Acceptance Criteria
[X] I must be able to edit my review from the playlist page
[ ] I must be able to edit my review from the playlist owner's page
[X] I must be able to edit the numerical rating
[X] I must be presented with errors if I make a mistake while editing
[ ] I must not be able to edit anyone else's reviews
) do

  scenario "user successfully edits own review" do

    user = FactoryGirl.create(:user)
    playlist = FactoryGirl.create(:playlist, user_id: user.id)
    review = FactoryGirl.create(:review, playlist_id: playlist.id, user_id: user.id)

    sign_in_as(user)

    visit edit_playlist_review_path(playlist, review)

    select review.rating, from: "Rating"
    fill_in "Description", with: review.description
    click_button "Update Review"

    expect(page).to have_content review.description
    expect(page).to have_content "You have successfully updated your review"
  end

  scenario "user unsuccessfully edits own review" do

    user = FactoryGirl.create(:user)
    playlist = FactoryGirl.create(:playlist, user_id: user.id)
    review = FactoryGirl.create(:review, playlist_id: playlist.id, user_id: user.id)

    sign_in_as(user)

    visit edit_playlist_review_path(playlist, review)

    select review.rating, from: "Rating"
    fill_in "Description", with: "and"
    click_button "Update Review"

    expect(page).to have_content "Description is too short (minimum is 25 characters)"
  end
end
