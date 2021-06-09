require 'open-uri'

puts "destroying all users and pets.."
User.destroy_all
Pet.destroy_all

puts "creating users and pets.."

CITY = %w[Meguro Shibuya Shinagawa Shimokitazawa Kichijyoji Ichikawa Yokohama Tachikawa Kameari Hibiya Matusdo Gotanda Meidaimae Kameido Tsujido Ikebukuro Kitasenju Shinjuku Sugamo Otsuka Kinshicho]
BIO = ["I love all animals", "I want to find a friend for my pet", "Looking for someone to walk my pet with", "I want some advice on raising a pet!", "I am a pet-lover"]

jose_img = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1618627703/exryfur10yoitc6uvdc2.jpg")
jose = User.create!(
  first_name: "Jose",
  last_name: "Portillo",
  email: "jose@test.com",
  password: "121212",
  city: "Ebisu",
  bio: "I work as a community helper. I like cheesebread and good beer",
  admin: true
  )
jose.photo.attach(io: jose_img, filename: 'jose.jpg', content_type: 'image/jpg')

ryan_img = URI.open("https://avatars.githubusercontent.com/u/65576226?v=4")
ryan = User.create!(
  first_name: "Ryan",
  last_name: "Kam",
  email: "ryan@test.com",
  password: "121212",
  city: "Shimokitazawa",
  bio: "I work as a manager for Kyoro. I've lived in Shimokitazawa for 3 years. I like surfing and micromanaging",
  admin: true
  )
ryan.photo.attach(io: ryan_img, filename: 'ryan.jpg', content_type: 'image/jpg')

alex_img = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1618495010/r3mmdrp9imzjv9yxejgx.jpg")
alex = User.create!(
  first_name: "Alexis",
  last_name: "An",
  email: "alex@test.com",
  password: "121212",
  city: "Kyodo",
  bio: "I've lived in Kyodo for a year. My pets are rescues. I like drawing and painting",
  admin: true
  )
alex.photo.attach(io: alex_img, filename: 'alex.jpg', content_type: 'image/jpg')

massim_img = URI.open("https://avatars.githubusercontent.com/u/65900884?v=4")
massim = User.create!(
  first_name: "Massim",
  last_name: "Shah",
  email: "massim@test.com",
  password: "121212",
  city: "Shibuya",
  bio: "I've recently moved to Tokyo. I adopted my dog from a shelter in Nerima. I usually go to Yoyogi Park to walk my dog. I like tacos.",
  admin: true
  )
massim.photo.attach(io: massim_img, filename: 'massim.png', content_type: 'image/png')

brady_img = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1618401471/nb2bhnpmpj7yhufbzvya.jpg")
brady = User.create!(
  first_name: "Brady",
  last_name: "Dornan",
  email: "brady@test.com",
  password: "121212",
  city: "Meguro",
  bio: "I'm vegetarian. I love my dog so much and would like to find him friends to play with!",
  admin: true
  )
brady.photo.attach(io: brady_img, filename: 'brady.png', content_type: 'image/png')

machiko_img = URI.open("https://avatars.githubusercontent.com/u/80950878?v=4")
machiko = User.create!(
  first_name: "Machiko",
  last_name: "Takahashi",
  email: "machiko@test.com",
  password: "121212",
  city: "Yokohama",
  bio: "I used to be a dancer. I go to starbucks to study on the weekends. I love all animals especially cats.",
  admin: true
  )
machiko.photo.attach(io: machiko_img, filename: 'machiko.png', content_type: 'image/png')

ryan_d_img = URI.open("https://res.cloudinary.com/dzwpbkn3u/image/upload/v1623138572/20210418_172701_qwkten.jpg")
ryan_d = Pet.create!(
  pet_name: "Luki",
  birthdate: Faker::Date.birthday(min_age: 5, max_age: 5),
  species: "Dog",
  breed: "Shiba",
  description: "Luki enjoys going for a walk in the park. He totally loves strangers",
  user: ryan
  )
ryan_d.photo.attach(io: ryan_d_img, filename: 'ryan_d.jpg', content_type: 'image/jpg')

j_cat_img = URI.open("https://i.pinimg.com/564x/ef/85/0a/ef850a4255a8b12ce9afe540ce16100d.jpg")
j_cat = Pet.create!(
  pet_name: "Boo",
  birthdate: Faker::Date.birthday(min_age: 1, max_age: 25),
  species: "Cat",
  breed: "Ragdoll",
  description: "Meow meow meow meow. Feed me",
  user: jose
  )
j_cat.photo.attach(io: j_cat_img, filename: 'j_cat.jpg', content_type: 'image/jpg')

a_dog_img = URI.open("https://i.pinimg.com/564x/60/66/42/606642ad3344512a2d47570dce80623c.jpg")
a_dog = Pet.create!(
  pet_name: "Howl",
  birthdate: Faker::Date.birthday(min_age: 1, max_age: 25),
  species: "Dog",
  breed: "Schnauzer",
  description: "I love cats",
  user: alex
  )
a_dog.photo.attach(io: a_dog_img, filename: 'dog.jpg', content_type: 'image/jpg')

m_dog_img = URI.open("https://i.pinimg.com/564x/a9/e4/ad/a9e4ad7fa723b2d1391a23d555b56df7.jpg")
m_dog = Pet.create!(
  pet_name: "Jasper",
  birthdate: Faker::Date.birthday(min_age: 1, max_age: 15),
  species: "Dog",
  breed: "Shiba",
  description: "Jasper loves running around and eating cheese.",
  user: massim
  )
m_dog.photo.attach(io: m_dog_img, filename: 'm_dog.jpg', content_type: 'image/jpg')

b_dog_img = URI.open("https://i.pinimg.com/564x/49/78/32/497832731de7eaffe9b9e974e64ce965.jpg")
b_dog = Pet.create!(
  pet_name: "Dylan",
  birthdate: Faker::Date.birthday(min_age: 1, max_age: 25),
  species: "Dog",
  breed: "Golden Retreiver",
  description: "She loves tomatoes and playing fetch. She's friendly and gets along with all dogs and people.",
  user: brady
  )
b_dog.photo.attach(io: b_dog_img, filename: 'b_dog.jpg', content_type: 'image/jpg')

kitty_img = URI.open("https://i.pinimg.com/564x/71/95/60/7195601aabb8f2fbf2a28ee28d3b3cc0.jpg")
kitty = Pet.create!(
  pet_name: "Maruetsu",
  birthdate: Faker::Date.birthday(min_age: 1, max_age: 25),
  species: "Cat",
  breed: "Not sure",
  description: "Maruetsu is so cute. She likes to be scratched on the back and enjoys sunbathing.",
  user: machiko
  )
kitty.photo.attach(io: kitty_img, filename: 'kitty.jpg', content_type: 'image/jpg')

20.times do
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
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 20),
      species: "Cat",
      breed: "American Short Hair",
      description: "Box is life",
      url: "https://res.cloudinary.com/dzwpbkn3u/image/upload/v1622823585/IMG_5622_idf0t2.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 20),
      species: "Cat",
      breed: "Scottish Fold",
      description: "He likes playing with my feet",
      url: "https://i.pinimg.com/564x/78/77/5d/78775de9e54393e79709d3055c48ad34.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 20),
      species: "Cat",
      breed: "Ragdoll",
      description: "She likes to cuddle",
      url: "https://i.pinimg.com/736x/2a/d8/99/2ad899c99b170ae986bb7b2cfc559849.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 20),
      species: "Cat",
      breed: "Persian",
      description: "She likes a good belly rub",
      url: "https://i.pinimg.com/564x/47/50/30/47503036f3deadd5e0e260cf3061de5b.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 20),
      species: "Cat",
      breed: "Munchkin",
      description: "Tiny legs",
      url: "https://i.pinimg.com/564x/3a/20/5b/3a205b18b50fefa3e0149c2a3f9165a8.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 20),
      species: "Dog",
      breed: "Shiba",
      description: "He's stubborn",
      url: "https://i.pinimg.com/564x/f8/04/aa/f804aad2fc1f256bc7569b777df3be3c.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 25),
      species: "Dog",
      breed: "Golden Retreiver",
      description: "She is a sweetheart",
      url: "https://i.pinimg.com/564x/78/31/ea/7831eae41673e755dbb89894d53b5bd1.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 25),
      species: "Dog",
      breed: "Poodle",
      description: "A little floof",
      url: "https://i.pinimg.com/564x/a2/02/12/a20212841496021d9f9252d6151051cf.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 25),
      species: "Dog",
      breed: "Mix",
      description: "My little shaggy dog",
      url: "https://i.pinimg.com/750x/ad/a2/c2/ada2c256be122e9b7e7a1a3e80725062.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 25),
      species: "Dog",
      breed: "Chihuahua",
      description: "My little shaggy dog",
      url: "https://i.pinimg.com/564x/a2/e6/fb/a2e6fba111b5fe6a953c78268d8056dd.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 25),
      species: "Pig",
      breed: "Mini Pig",
      description: "She loves mud",
      url: "https://i.pinimg.com/564x/fd/05/c6/fd05c6a91c5045d3fed11785fc51555d.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 7),
      species: "Hamster",
      breed: "Golden Hamster",
      description: "She sleeps 24/7",
      url: "https://i.pinimg.com/564x/45/7d/7d/457d7d52c51b0aca32a2f92f9d8c9521.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 20),
      species: "Lizard",
      breed: "Beared Lizard",
      description: "He likes flowers",
      url: "https://i.pinimg.com/564x/ef/8b/cb/ef8bcb6a50a25854692297951487e731.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 15),
      species: "Rabbit",
      breed: "Netherland Dwarf",
      description: "She likes daisies",
      url: "https://i.pinimg.com/564x/da/dc/db/dadcdbe32890d8682400f917fd6a6cb7.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 15),
      species: "Rabbit",
      breed: "Holland Loop",
      description: "He likes to nap like this",
      url: "https://i.pinimg.com/564x/9d/82/42/9d82428df38c6c0c8b822d61f252302d.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 15),
      species: "Guinnea Pig",
      breed: "American Guinnea Pig",
      description: "He also likes to nap like this",
      url: "https://i.pinimg.com/564x/6c/8c/b6/6c8cb6d9c3c99addb244032121b5ad40.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 15),
      species: "Bird",
      breed: "Parakeet",
      description: "She loves to sing!",
      url: "https://i.pinimg.com/564x/a7/7d/1c/a77d1c4c687a58e2aed4787838e4cf91.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 15),
      species: "Bird",
      breed: "Duck",
      description: "He loves ice water",
      url: "https://i.pinimg.com/564x/39/ba/68/39ba6870a9199f318a27d2c034b76b83.jpg"
    },

    {
      pet_name: Faker::Creature::Dog.name,
      birthdate: Faker::Date.birthday(min_age: 1, max_age: 15),
      species: "Ferret",
      breed: "North-American",
      description: "He is a little trouble maker",
      url: "https://i.pinimg.com/564x/86/f4/08/86f408e2be7129d9f8a283d3641fa5ec.jpg"
    }
]

User.where(admin: nil).in_groups(pets.length).each_with_index do |group, index|
  group.each do |user|
    pet_hash = pets[index]
    pet = Pet.new(pet_hash)
    pet.user = user
    pet.save
    file = URI.open(pet_hash[:url])
    pet.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
  end
end

jose_ps_img = URI.open("https://i.pinimg.com/564x/67/0e/32/670e32744bf281ffb744c53dbcffebc5.jpg")
jose_ps = PetSitting.create!(
  description: "I have experience working at a cat cafe. Currently, my main job is pet grooming. I'm a good caretaker",
  price: 2000,
  user: jose
  )
jose_ps.photo.attach(io: jose_ps_img, filename: 'jose_ps.jpg', content_type: 'image/jpg')

brady_ps_img = URI.open("https://i.pinimg.com/564x/dd/26/df/dd26df5341ef153cabe9ef6504477cb1.jpg")
brady_ps = PetSitting.create!(
  description: "I love all animals and they love me! I've been a petsitter for 2 years. I'll take good care of your pets!",
  price: 1500,
  user: brady
  )
brady_ps.photo.attach(io: brady_ps_img, filename: 'brady_ps.jpg', content_type: 'image/jpg')

puts "created #{User.count} users #{Pet.count} pets"
