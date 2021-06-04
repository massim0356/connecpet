require 'open-uri'

puts "destroying all users and pets.."
User.destroy_all
Pet.destroy_all

puts "creating users and pets.."

CITY = %w[Meguro Shibuya Shinagawa Shimokitazawa Kichijyoji Ichikawa Yokohama Tachikawa Kameari Hibiya Matusdo]
BIO = ["I love cats" "I love dogs", "I want to find my pet a friend", "Looking for someone to walk dogs with", "I love jogging with my dog", "My cat enjoys going for a walk"]

alex_img = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1618495010/r3mmdrp9imzjv9yxejgx.jpg")
alex = User.create!(
  first_name: "Alexis",
  last_name: "An",
  email: "alex@test.com",
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

45.times do
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
      breed: "Scottish Fold",
      description: "He likes boxes",
      url: "https://i.pinimg.com/564x/34/2c/c6/342cc6b8b782d386d6001f03411be523.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Cat",
      breed: "Ragdoll",
      description: "She likes to cuddle",
      url: "https://i.pinimg.com/736x/2a/d8/99/2ad899c99b170ae986bb7b2cfc559849.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Cat",
      breed: "Persian",
      description: "She likes a good belly rub",
      url: "https://i.pinimg.com/originals/55/65/48/5565482849dc9f8b01ef22c7c03db28f.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Cat",
      breed: "Munchkin",
      description: "Tiny legs",
      url: "https://i.pinimg.com/564x/3a/20/5b/3a205b18b50fefa3e0149c2a3f9165a8.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Dog",
      breed: "Shiba",
      description: "He's stubborn",
      url: "https://i.pinimg.com/564x/f8/04/aa/f804aad2fc1f256bc7569b777df3be3c.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Dog",
      breed: "Golden Retreiver",
      description: "She is a sweetheart",
      url: "https://i.pinimg.com/564x/2f/53/e3/2f53e3c6b8609cd8dc0531767a2f47b4.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Dog",
      breed: "Poodle",
      description: "A little floof",
      url: "https://i.pinimg.com/564x/a2/02/12/a20212841496021d9f9252d6151051cf.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Dog",
      breed: "Mix",
      description: "My little shaggy dog",
      url: "https://i.pinimg.com/750x/ad/a2/c2/ada2c256be122e9b7e7a1a3e80725062.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Dog",
      breed: "Chihuahua",
      description: "My little shaggy dog",
      url: "https://i.pinimg.com/564x/9d/e5/16/9de5168de32d3b856b8266c698edc119.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Pig",
      breed: "Mini Pig",
      description: "She loves mud",
      url: "https://i.pinimg.com/564x/fd/05/c6/fd05c6a91c5045d3fed11785fc51555d.jpg"
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
      species: "Lizard",
      breed: "Beared Lizard",
      description: "He likes flowers",
      url: "https://i.pinimg.com/564x/ef/8b/cb/ef8bcb6a50a25854692297951487e731.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Rabbit",
      breed: "Netherland Dwarf",
      description: "She likes daisies",
      url: "https://i.pinimg.com/564x/39/be/5c/39be5cea18aeeea8b56003b84292f26a.jpg"
    },

    {
      pet_name: Faker::JapaneseMedia::StudioGhibli.character,
      birthdate: Faker::Date.birthday,
      species: "Lizard",
      breed: "Holland Loop",
      description: "He likes to nap like this",
      url: "https://i.pinimg.com/564x/9d/82/42/9d82428df38c6c0c8b822d61f252302d.jpg"
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
