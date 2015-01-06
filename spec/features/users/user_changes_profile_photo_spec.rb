require "rails_helper"

feature "user changes their photo", %q(

As a user
I want to change my profile photo
So that it can reflect my recent weight loss

Acceptance Criteria
[x] I must be able to change my photo from my Account Management Page
[x] I must be able to delete my photo from my Account Management Page
[x] I must limit the type of files I can upload

) do

  scenario "user successfully changes photo" do

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit edit_user_registration_path

    attach_file('Change your Photo', 'app/assets/images/omar_coming.jpg')
    fill_in "Current password", with: user.password

    click_button "Update"

    visit user_path(user)

    expect(page).to have_xpath("//img[@src=\"/uploads/user/profile_photo/#{user.id}/omar_coming.jpg\"]")

  end

  scenario "user successfully removes photo" do

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit edit_user_registration_path

    check("Remove your Photo")

    fill_in "Current password", with: user.password

    click_button "Update"

    visit user_path(user)

    expect(page).to have_xpath("//img[@src=\"http://sellleadsucceed.files.wordpress.com/2014/02/bigstock-silhouette-with-a-question-mar-59367497.jpg\"]")

  end

  scenario "user tries to upload unacceptable file type" do

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit edit_user_registration_path

    attach_file('Change your Photo', 'app/assets/images/hashes.txt')
    fill_in "Current password", with: user.password

    click_button "Update"

    expect(page).to have_content "You are not allowed to upload \"txt\" files, allowed types: jpg, jpeg, gif, png"

  end


end
