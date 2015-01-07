class UserMailer < ApplicationMailer
  default from: "spotlist.launch@gmail.com"
  def review_notification(playlist_creator)
    @user = playlist_creator
    @url = 'http://spotlist-launch.herokuapp.com/playlists/#{@playlist.id}'
    mail(to: @user, subject: 'Someone has just reviewed your playlist')
  end
end
