# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'

url = "https://www.secrettelaviv.com/magazine/blog/best-bars-and-clubs"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
types = ["Bar", "Club"]
puts 'Creating seeds...'

html_doc.search('b a').each do |element|
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

    place_url = element.attribute("href")
    html_file2 = open(place_url).read
    html_doc2 = Nokogiri::HTML(html_file2)
    location = 0
    html_doc2.search(".geodir_more_info  span[itemprop='streetAddress']").each do |element1|
      location = element1.text
    end
    name = html_doc2.search(".post-title").first.text.strip
    description = html_doc2.search("#post-content p").first.text.strip

    photo = html_doc2.css("li img")[1].attribute("src") if !html_doc2.css("li img")[1].nil?
    place = Place.new(
      name: name,
      location: location,
      description: description,
      place_type: types.sample,
      photo: photo,
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
      friendship = Following.new(
        follower: user,
        following: User.find(user.id - 1)
        )
      friendship.save
    end
end
puts 'Finished!'

