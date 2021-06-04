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

otter_img = URI.open("https://www.gannett-cdn.com/-mm-/7cfa0cdce1b602172c2e2961197d42679ab2b3cc/c=0-278-2520-1702/local/-/media/2017/01/28/USATODAY/USATODAY/636211875995222622-GettyImages-462548187.jpg")
otter = Pet.create!(
  pet_name: Faker::JapaneseMedia::StudioGhibli.character,
  birthdate: Faker::Date.birthday, species: "Otter",
  breed: "Asian Small-clawed Otter",
  description: "I love fish",
  user: test_admin
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

10.times do
  cat_img = URI.open("https://cdn.geekwire.com/wp-content/uploads/2021/03/Screen-Shot-2021-03-09-at-4.34.29-PM.png")
  cat = Pet.create!(
    pet_name: Faker::JapaneseMedia::StudioGhibli.character,
    birthdate: Faker::Date.birthday,
    species: "Cat",
    breed: "American Short Hair",
    description: "She likes fish",
    user: User.all.sample
    )
  cat.photo.attach(io: cat_img, filename: 'cat.png', content_type: 'image/png')
end

10.times do
  birman_img = URI.open("https://cdn.geekwire.com/wp-content/uploads/2021/03/Screen-Shot-2021-03-09-at-4.34.29-PM.png")
  birman = Pet.create!(
    pet_name: Faker::JapaneseMedia::StudioGhibli.character,
    birthdate: Faker::Date.birthday,
    species: "Cat",
    breed: "Birman",
    description: "He likes boxes",
    user: User.all.sample
    )
  birman.photo.attach(io: birman_img, filename: 'birman.png', content_type: 'image/png')
end

10.times do
  dog_img = URI.open("https://i.imgflip.com/4/4t0m5.jpg")
  dog = Pet.create!(
    pet_name: Faker::JapaneseMedia::StudioGhibli.character,
    birthdate: Faker::Date.birthday, species: "Dog",
    breed: "Shibe",
    description: "He's stubborn",
    user: User.all.sample
    )
  dog.photo.attach(io: dog_img, filename: 'dog.jpg', content_type: 'image/jpg')
end

10.times do
  golden_img = URI.open("https://i.pinimg.com/originals/39/d7/b9/39d7b92471192ae8e445a54f7d85b508.jpg")
  golden = Pet.create!(
    pet_name: Faker::JapaneseMedia::StudioGhibli.character,
    birthdate: Faker::Date.birthday,
    species: "Dog",
    breed: "Golden Retreiver",
    description: "She is a sweetheart",
    user: User.all.sample
    )
  golden.photo.attach(io: golden_img, filename: 'golden.jpg', content_type: 'image/jpg')
end

10.times do
  pig_img = URI.open("http://tamuvetmed.wpengine.com/news/wp-content/uploads/sites/9/2018/05/pig-300x210.png")
  pig = Pet.create!(
    pet_name: Faker::JapaneseMedia::StudioGhibli.character,
    birthdate: Faker::Date.birthday,
    species: "Pig",
    breed: "Mini Pig",
    description: "She loves mud",
    user: User.all.sample
    )
  pig.photo.attach(io: pig_img, filename: 'pig.png', content_type: 'image/png')
end

10.times do
  owl_img = URI.open("https://farm9.staticflickr.com/8659/16167077194_d4a7a433d8_b.jpg")
  owl = Pet.create!(
    pet_name: Faker::JapaneseMedia::StudioGhibli.character,
    birthdate: Faker::Date.birthday,
    species: "Owl",
    breed: "Snowy Owl",
    description: "He likes flying",
    user: User.all.sample
    )
  owl.photo.attach(io: owl_img, filename: 'owl.jpg', content_type: 'image/jpg')
end

5.times do
  sugar_img = URI.open("https://149366112.v2.pressablecdn.com/wp-content/uploads/2016/03/shutterstock_123694948-scaled.jpg")
  sugar = Pet.create!(
    pet_name: Faker::JapaneseMedia::StudioGhibli.character,
    birthdate: Faker::Date.birthday,
    species: "Sugar Glider",
    breed: "Sugar Glider",
    description: "He likes nuts",
    user: User.all.sample
    )
  sugar.photo.attach(io: sugar_img, filename: 'sugar.jpg', content_type: 'image/jpg')
end

5.times do
  hamster_img = URI.open("https://i.pinimg.com/originals/b5/fe/35/b5fe35f4595339a89e304a6470f17ae3.jpg")
  hamster = Pet.create!(
    pet_name: Faker::JapaneseMedia::StudioGhibli.character,
    birthdate: Faker::Date.birthday,
    species: "Hamster",
    breed: "Golden Hamster",
    description: "She sleeps 24/7",
    user: User.all.sample
    )
  hamster.photo.attach(io: hamster_img, filename: 'hamster.jpg', content_type: 'image/jpg')
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
