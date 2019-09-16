# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
types = ["Bar", "Club"]
10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    location: Faker::Address.city,
    gender: Faker::Gender.binary_type,
    age: Faker::Number.between(from: 18, to: 35),
    email: Faker::Internet.email,
    password: 123456,
    username: Faker::Name.first_name + Faker::Name.last_name,
    bio: Faker::Lorem.paragraph,
    photo: "https://source.unsplash.com/random"
    )
  user.save
  place = Place.new(
    name: Faker::Name.name,
    location: Faker::Address.city,
    description: Faker::Lorem.paragraph,
    place_type: types.sample,
    photo: "https://source.unsplash.com/random",
    age_group: Faker::Number.between(from: 18, to: 35)
    )
  place.save
  checkin = CheckIn.new(
    user: user,
    place: place,
    comment: Faker::Lorem.paragraph,
    type_of_music: Faker::Music.genre,
    photo: "https://source.unsplash.com/random"
    )
  checkin.save
  favs = FavoritePlace.new(
    user: user,
    place: place
    )
  favs.save
  if User.all.length > 2
    friendship = Friendship.new(
      user: user,
      friend: User.find(user.id - 1)
      )
    friendship.save
  end
end

