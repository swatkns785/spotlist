class UserMailer < ApplicationMailer
  default from: "spotlist.launch@gmail.com"
  def review_notification(reviewed_playlist)
    @user = reviewed_playlist.user.email
    @playlist = reviewed_playlist.id
    @url = "http://spotlist-launch.herokuapp.com/playlists/#{@playlist}"
    mail(to: @user, subject: 'Someone has just reviewed your playlist')
  end
end
