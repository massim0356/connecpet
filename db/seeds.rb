require 'open-uri'

puts "destroying all users and pets.."
User.destroy_all
Pet.destroy_all

puts "creating users and pets.."

CITY = %w[Meguro, Shibuya, Shinagawa, Shimokitazawa, Kichijyoji, Ichikawa, Yokohama, Tachikawa, Kameari, Hibiya, Matusdo]
BIO = ["I love cats", "I love dogs", "I love owls", "I have pet rocks", "Looking for someone to walk dogs with", "I have 12 cats"]

alex_img = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1618495010/r3mmdrp9imzjv9yxejgx.jpg")
alex = User.create!(
  first_name: "Alexis",
  last_name: "An",
  email: "alex@test.com" ,
  password: "121212",
  city: "Kyodo",
  bio: "I am Alex",
  admin: true
  )
alex.photo.attach(io: alex_img, filename: 'alex.jpg', content_type: 'image/jpg')

massim_img = URI.open("https://avatars.githubusercontent.com/u/65900884?v=4")
massim = User.create!(
  first_name: "Massim",
  last_name: "Shah",
  email: "massim@test.com",
  password: "121212",
  city: CITY.sample,
  bio: "I am Massim",
  admin: true
  )
massim.photo.attach(io: massim_img, filename: 'massim.png', content_type: 'image/png')

brady_img = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1618401471/nb2bhnpmpj7yhufbzvya.jpg")
brady = User.create!(
  first_name: "Brady",
  last_name: "Dornan",
  email: "brady@test.com",
  password: "121212",
  city: "Yokohama",
  bio: "I am Brady"
  )
brady.photo.attach(io: brady_img, filename: 'brady.png', content_type: 'image/png')

machiko_img = URI.open("https://avatars.githubusercontent.com/u/80950878?v=4")
machiko = User.create!(
  first_name: "Machiko",
  last_name: "Takahashi",
  email: "machiko@test.com",
  password: "121212",
  city: "Yokohama",
  bio: "I am Machiko"
  )
machiko.photo.attach(io: machiko_img, filename: 'machiko.png', content_type: 'image/png')

otter_img = URI.open("https://www.gannett-cdn.com/-mm-/7cfa0cdce1b602172c2e2961197d42679ab2b3cc/c=0-278-2520-1702/local/-/media/2017/01/28/USATODAY/USATODAY/636211875995222622-GettyImages-462548187.jpg")
otter = Pet.create!(
  pet_name: Faker::JapaneseMedia::StudioGhibli.character,
  birthdate: Faker::Date.birthday, species: "Otter",
  breed: "Asian Small-clawed Otter",
  description: "I love fish",
  user: massim
  )
otter.photo.attach(io: otter_img, filename: 'otter.jpg', content_type: 'image/jpg')

50.times do
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

pets = [
    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Cat",
      breed: "American Short Hair",
      description: "She likes fish",
      url: "https://cdn.geekwire.com/wp-content/uploads/2021/03/Screen-Shot-2021-03-09-at-4.34.29-PM.png"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Cat",
      breed: "Birman",
      description: "He likes boxes",
      url: "https://cdn.geekwire.com/wp-content/uploads/2021/03/Screen-Shot-2021-03-09-at-4.34.29-PM.png"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Dog",
      breed: "Shibe",
      description: "He's stubborn",
      url: "https://i.imgflip.com/4/4t0m5.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Dog",
      breed: "Golden Retreiver",
      description: "She is a sweetheart",
      url: "https://i.pinimg.com/originals/39/d7/b9/39d7b92471192ae8e445a54f7d85b508.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Pig",
      breed: "Mini Pig",
      description: "She loves mud",
      url: "http://tamuvetmed.wpengine.com/news/wp-content/uploads/sites/9/2018/05/pig-300x210.png"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Owl",
      breed: "Snowy Owl",
      description: "He likes flying",
      url: "https://farm9.staticflickr.com/8659/16167077194_d4a7a433d8_b.jpg",
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Hamster",
      breed: "Golden Hamster",
      description: "She sleeps 24/7",
      url: "https://i.pinimg.com/originals/b5/fe/35/b5fe35f4595339a89e304a6470f17ae3.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Hamster",
      breed: "Dwarf Hamster",
      description: "Her favorite food is sunflower seeds",
      url: "https://i.pinimg.com/originals/73/f7/a3/73f7a338eb28c6f07ab4b953d6669dfa.jpg"
    }
]

User.all.in_groups(pets.length).each_with_index do |group, index|
  group.each do |user|
    pet_hash = pets[index]
    pet = Pet.new(pet_hash)
    pet.user = user
    pet.save
    file = URI.open(pet_hash[:url])
    pet.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
  end
end

puts "created #{User.count} users #{Pet.count} pets"
