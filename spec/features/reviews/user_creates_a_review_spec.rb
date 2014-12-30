require 'rails_helper'

feature "a registered user reviews a playlist", %q(
As a user
I want to review someone else's playlist
So that I can give them feedback on their musical tastes

Acceptance Criteria
[ ] I must be able to leave a rating (numerical)
[ ] I must be able to leave a description with my review (minimum 25 characters)
[ ] I must be able to leave the review from the playlist show page
[ ] Once submitted, I must see my review description, my review rating, and my email.
[ ] I must be presented with errors if I fill out the description field incorrectly or neglect to choose rating.
) do

  scenario "user successfully reviews a playlist" do

    user = FactoryGirl.create(:user)
    playlist = FactoryGirl.create(:playlist, user_id: user.id)
    review = FactoryGirl.create(:review, playlist_id: playlist.id, user_id: user.id)

    sign_in_as(user)

    visit playlist_path(playlist)

    select review.rating, from: "Rating"
    fill_in "Description", with: review.description
    click_button "Submit Review"

    expect(page).to have_content "You have successfully created a review"
    expect(page).to have_content review.rating
    expect(page).to have_content review.description
    expect(page).to have_content review.user.email
  end


  scenario "user is notified with errors when review creation is prevented" do

    user = FactoryGirl.create(:user)
    playlist = FactoryGirl.create(:playlist, user_id: user.id)
    review = FactoryGirl.create(:review, playlist_id: playlist.id, user_id: user.id)

    sign_in_as(user)
    visit playlist_path(playlist)


    select "1", from: "Rating"
    click_button "Submit Review"

    expect(page).to have_content "You have missing fields"
    expect(page).to_not have_content "Rating: 1"
  end
end
