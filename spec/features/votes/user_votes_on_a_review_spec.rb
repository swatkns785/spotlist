require 'rails_helper'

feature 'User votes on a review', %q(

As a user
I want to be able to vote on a review
So that I can assist others in seeing useful information

Acceptance Criteria
[ ] I must be able to vote once per review
[ ] I must be able to change my review
[ ] I must not be able to vote on a review that I have written
[ ] I must see the highest voted review at the top

) do

  scenario "user votes on a review", focus: true do
    review1 = FactoryGirl.create(:review)
    review2 = FactoryGirl.create(:review)

    sign_in_as(review1.user)

    visit playlist_path(review2.playlist)

    click_link "Upvote"

    expect(page).to have_content "Score: 1"
  end
end
