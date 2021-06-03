require 'open-uri'

puts "destroying all users and pets.."
User.destroy_all
Pet.destroy_all

puts "creating users and pets.."

CITY = %w[Meguro, Shibuya, Shinagawa, Shimokitazawa, Kichijyoji, Ichikawa, Yokohama, Tachikawa, Kameari, Hibiya, Matusdo]
BIO = ["I love cats", "I love dogs", "I love owls", "I have pet rocks", "Looking for someone to walk dogs with", "I have 12 cats"]

test_img = URI.open("https://avatars.githubusercontent.com/u/65900884?v=4")
test_admin = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name, email: "test@test.com" ,
  password: "121212",
  city: "Ichikawa",
  bio: "I am admin",
  admin: true
  )
test_admin.photo.attach(io: test_img, filename: 'test.jpg', content_type: 'image/jpg')

user_img = URI.open("https://avatars.githubusercontent.com/u/65900884?v=4")
test_user = User.create!(
  first_name: "Massim",
  last_name: "Shah",
  email: "massim@test.com",
  password: "121212",
  city: CITY.sample,
  bio: "I am test user"
  )
test_user.photo.attach(io: user_img, filename: 'massim.png', content_type: 'image/png')

5.times do
  file = URI.open('https://thispersondoesnotexist.com/image')
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "121212",
    city: CITY.sample,
    bio: BIO.sample
    )
  user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
end

5.times do
dwarf_img = URI.open("https://i.pinimg.com/originals/73/f7/a3/73f7a338eb28c6f07ab4b953d6669dfa.jpg")
dwarf = Pet.create!(
  pet_name: Faker::JapaneseMedia::StudioGhibli.character,
  birthdate: Faker::Date.birthday,
  species: "Hamster",
  breed: "Dwarf Hamster",
  description: "Her favorite food is sunflower seeds",
  user: User.all.sample
  )
dwarf.photo.attach(io: dwarf_img, filename: 'dwarf.jpg', content_type: 'image/jpg')
end

puts "created #{User.count} users #{Pet.count} pets"
