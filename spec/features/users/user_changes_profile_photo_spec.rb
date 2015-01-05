require "rails_helper"

feature "user changes their photo", %q(

As a user
I want to change my profile photo
So that it can reflect my recent weight loss

Acceptance Criteria
[ ] I must be able to change my photo from my Account Management Page
[ ] I must only be allowed to upload GIF, JPG, or PNG formats
[ ] If I try to upload file that is not image, I receive the appropriate error messages

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

end
