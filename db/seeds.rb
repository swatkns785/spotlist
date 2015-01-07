# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 10.times do
#   email = Faker::Internet.email
#   password = Faker::Lorem.characters(10)
#   image = Faker::Avatar.image
#   User.create!(email: email, password: password, profile_photo: image)
# end

Playlist.create!(user_id: 13, title: "nude with boots", url: "spotify:user:mayorjama:playlist:3wQPs7FMckds7dwu7XEsqn", description: Faker::Lorem.paragraph(2))
Playlist.create!(user_id: 14, title: "Funk Dat", url: "spotify:user:mayorjama:playlist:2aWZ0NSU5vWiSb80v9kpFs", description: Faker::Lorem.paragraph(2))
Playlist.create!(user_id: 15, title: "BEEPBEEPBOOPBOOP", url: "spotify:user:mayorjama:playlist:4e9sCydbXgYxucrxMIPLLI", description: Faker::Lorem.paragraph(2))
Playlist.create!(user_id: 16, title: "oh canada", url: "spotify:user:1216224186:playlist:2DfWacHcJjdJIaTo4MOMAQ", description: Faker::Lorem.paragraph(2))
Playlist.create!(user_id: 17, title: "ughh", url: "spotify:user:1216224186:playlist:3pNvLQq21242BPhEKdyJ1Z", description: Faker::Lorem.paragraph(2))
Playlist.create!(user_id: 18, title: "NFG", url: "spotify:user:1216224186:playlist:6HzwB267phB7v8qPp8TBOE", description: Faker::Lorem.paragraph(2))
Playlist.create!(user_id: 19, title: "For Today", url: "spotify:user:123933168:playlist:1av0hNHsCo3btBs9kyGuaj", description: Faker::Lorem.paragraph(2))
Playlist.create!(user_id: 20, title: "Dah Bass", url: "spotify:user:123933168:playlist:27vfYzM1k5iSfODSxDL8VT", description: Faker::Lorem.paragraph(2))
Playlist.create!(user_id: 21, title: "Humanos", url: "spotify:user:123933168:playlist:7iYX9QAREkjNnNPmw250sd", description: Faker::Lorem.paragraph(2))
Playlist.create!(user_id: 22, title: "Funkenstein", url: "spotify:user:1269305650:playlist:4UIB6gUOwjKkaUlakZtcxv", description: Faker::Lorem.paragraph(2))
