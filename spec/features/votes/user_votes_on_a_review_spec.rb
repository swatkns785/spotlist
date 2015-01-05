require 'rails_helper'

feature 'User votes on a review', %q(

As a user
I want to be able to vote on a review
So that I can assist others in seeing useful information

Acceptance Criteria
[x] I must be able to vote once per review
[x] I must be able to change my vote
[x] I must not be able to vote on a review that I have written
[ ] I must see the highest voted review at the top

) do

  scenario "user upvotes on a review" do
    review1 = FactoryGirl.create(:review)
    review2 = FactoryGirl.create(:review)

    sign_in_as(review1.user)

    visit playlist_path(review2.playlist)

    click_link "Upvote"

    expect(page).to have_content "Score: 1"
  end

  scenario "user votes on a review" do
    review1 = FactoryGirl.create(:review)
    review2 = FactoryGirl.create(:review)

    sign_in_as(review1.user)

    visit playlist_path(review2.playlist)

    click_link "Upvote"

    expect(page).to have_content "Score: 1"
  end

  scenario "user changes a vote" do
    review1 = FactoryGirl.create(:review)
    review2 = FactoryGirl.create(:review)

    sign_in_as(review1.user)

    visit playlist_path(review2.playlist)

    click_link "Upvote"

    expect(page).to have_content "Score: 1"

    click_link "Downvote"

    expect(page).to have_content "Score: -1"
    expect(page).to have_content "Your vote has been updated."
  end

  scenario "user tries to input same vote twice" do
    review1 = FactoryGirl.create(:review)
    review2 = FactoryGirl.create(:review)

    sign_in_as(review1.user)
    visit playlist_path(review2.playlist)

    2.times do
      click_link "Upvote"
    end
    expect(page).to have_content "Score: 1"
    expect(page).to have_content "You have already up-voted for this review."

    2.times do
      click_link "Downvote"
    end
    expect(page).to have_content "Score: -1"
    expect(page).to have_content "You have already down-voted for this review."
  end
end
