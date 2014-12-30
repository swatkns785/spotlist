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

    sign_in_as(user)

    click_link "Add a playlist"

    expect(page).to have_content "Fill out the form below to add your playlist"
    fill_in "Title", with: playlist.title
    fill_in "URL", with: playlist.url
    fill_in "Description", with: playlist.description
    click_button "Submit Playlist"

    fill_in "Rating", with: "5"
    fill_in "Description", with: "This is a great playlist, would recommend"
    click_button "Submit Review"

    expect(page).to have_content "Your review has been successfully added."
    expect(page).to have_content review.rating
    expect(page).to have_content review.description
    expect(page).to have_content review.user.email
  end


  scenario "user is notified with errors when review creation is prevented" do

    user = FactoryGirl.create(:user)
    playlist = FactoryGirl.create(:playlist, user_id: user.id)

    sign_in_as(user)

    click_link "Add a playlist"

    expect(page).to have_content "Fill out the form below to add your playlist"
    fill_in "Title", with: playlist.title
    fill_in "URL", with: playlist.url
    fill_in "Description", with: playlist.description
    click_button "Submit Playlist"

    fill_in "Rating", with: "5"
    click_button "Submit Review"

    expect(page).to have_content "Description can't be blank."
    expect(page).to have_content review.rating
    expect(page).to_not have_content review.description
    expect(page).to have_content review.user.email
  end
end
