# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'
CheckIn.destroy_all
FavoritePlace.destroy_all
Following.destroy_all
Place.destroy_all
User.destroy_all
url = "https://www.secrettelaviv.com/magazine/blog/best-bars-and-clubs"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
types = ["Bar", "Club"]
puts 'Creating seeds...'
comments = ["A great bar to meet friendly people from all around the world. Fisrst, we had beer & pizza, and then we went in side to get the edm atmosphere.",
"it's a bit 'hidden place' you walk by a small entrance", "place is crazy crowded", "DONT come place is full with Arsim", "Wow", "if someone found a wallet lmk pls!", "definitely worth the line outside!", "🍺🍺🍺", "place just got better!"]
snapshots= ["https://igoogledisrael.com/wp-content/uploads/2016/12/SylvesterTelAviv-1024x683.jpg", "https://www.dailydot.com/wp-content/uploads/fda/de/8eeb21ec2e0ce406053a9f6a786c4cbb.jpg", "https://66.media.tumblr.com/2758c4f4d76d1f0e7f9828d3b9ead6d1/tumblr_mpdudhbGem1qmkdzvo1_400.gif",
"https://scontent.fsdv3-1.fna.fbcdn.net/v/t1.0-9/70149768_2600449293341307_165715686709002240_o.jpg?_nc_cat=100&_nc_oc=AQnPr-jViVdpCH8WFMtrK0fs3MILX4_Vj8TKgBIymMkpM4lxWJMK8lLX7k9OtBmRejo&_nc_ht=scontent.fsdv3-1.fna&oh=da8a13dc7425b426fac199d0c118fe39&oe=5E34D421",
]
profiles = ["https://res.cloudinary.com/dmek0yyje/image/upload/v1569495197/image_4_i36ov1.png", "https://res.cloudinary.com/dmek0yyje/image/upload/v1569495196/image_1_k8a1cz.png","https://res.cloudinary.com/dmek0yyje/image/upload/v1569495196/image_t2qnjf.png","https://res.cloudinary.com/dmek0yyje/image/upload/v1569495196/image_2_rs5gz6.png",
  "https://res.cloudinary.com/dmek0yyje/image/upload/v1569495196/image_3_t0ux1v.png","https://res.cloudinary.com/dmek0yyje/image/upload/v1569495482/image_9_vrqfzi.png","https://res.cloudinary.com/dmek0yyje/image/upload/v1569495481/image_8_zs5msg.png","https://res.cloudinary.com/dmek0yyje/image/upload/v1569495326/image_7_k7ssba.png","https://res.cloudinary.com/dmek0yyje/image/upload/v1569495198/image_5_pgg6zg.png",
  "https://res.cloudinary.com/dmek0yyje/image/upload/v1569495197/image_6_fsjsvs.png",
"https://res.cloudinary.com/dmek0yyje/image/upload/v1569494329/IMG_7390_kjgz0f.jpg","https://res.cloudinary.com/dmek0yyje/image/upload/v1569494290/fullsizeoutput_815d_aqwdfw.jpg","https://res.cloudinary.com/dmek0yyje/image/upload/v1569494290/fullsizeoutput_815b_n0d7l4.jpg",
"https://res.cloudinary.com/dmek0yyje/image/upload/v1569494210/fullsizeoutput_8165_lnuzu8.jpg","https://res.cloudinary.com/dmek0yyje/image/upload/v1569494210/XlIW5RIxTMKxzn3mljwsCw_pni9ya.jpg","https://res.cloudinary.com/dmek0yyje/image/upload/v1569494210/fullsizeoutput_816e_ciflkw.jpg","https://res.cloudinary.com/dmek0yyje/image/upload/v1569494210/fullsizeoutput_8166_ee1nap.jpg",
"https://res.cloudinary.com/dmek0yyje/image/upload/v1569494210/fullsizeoutput_8162_j1ejci.jpg","https://res.cloudinary.com/dmek0yyje/image/upload/v1569494209/fullsizeoutput_815f_pkmode.jpg",
"https://res.cloudinary.com/dmek0yyje/image/upload/v1569494210/fullsizeoutput_8161_on6b1v.jpg","https://res.cloudinary.com/dmek0yyje/image/upload/v1569494209/fullsizeoutput_816d_jvn0dq.jpg"]
counter = 0
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
    bio: Faker::Quote.matz,
    remote_photo_url: profiles[counter]
    )
  user.save!

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
    remote_photo_url: photo,
    age_group: Faker::Number.between(from: 18, to: 35)
    )
    place.save!
  if counter.even?
    checkin = CheckIn.new(
      user: user,
      place: place,
      comment: comments.sample ,
      type_of_music: CheckIn::TYPE_OF_MUSIC.sample,
      remote_photo_url: snapshots.sample
    )
  else
    checkin = CheckIn.new(
      user: user,
      place: place,
      comment: comments.sample ,
      type_of_music: CheckIn::TYPE_OF_MUSIC.sample,
    )
  end
  checkin.save!
  favs = FavoritePlace.new(
    user: user,
    place: place
    )
  favs.save!
  if User.all.length > 2
    friendship = Following.new(
      following: user,
      follower: User.find(user.id - 1)
    )
    friendship.save!
  end
  counter += 1
  puts counter
end
  place = Place.new(
    name: "Rise - Tel Aviv",
    location: "54 Ahad Ha’am Street Tel Aviv",
    place_type: types.sample,
    remote_photo_url: "https://scontent.fsdv3-1.fna.fbcdn.net/v/t1.0-9/12932703_1781301255434571_7111641855505993639_n.png?_nc_cat=109&_nc_oc=AQka18uzMUdDSxBoWFAKNohVlKB75qeFkZNHoqlWqvWDDXQWcQomLg4tcr0YuDgoDCU&_nc_ht=scontent.fsdv3-1.fna&oh=0ba4bdcf146ded9b31770775f1ec3801&oe=5E38715B",
    age_group: Faker::Number.between(from: 18, to: 35)
    )
    place.save!
puts 'Finished!'

