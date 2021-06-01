require 'open-uri'

puts "destroying all users and pets.."
User.destroy_all
Pet.destroy_all

puts "creating users and pets.."

test_user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "test@test.com" , password: "000000", city: "Meguro", bio: Faker::ChuckNorris.fact)
massim = User.create!(first_name: "Massim", last_name: "Shah", email: "massim@test.com" , password: "000000", city: "Dumpster", bio: "I enjoy consuming dust")

user_1_img = URI.open("https://res.cloudinary.com/dzwpbkn3u/image/upload/v1622188810/z9oabmvgmc14zhxeohgtunyfmkks.png")
user_1 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "000000", city: "Meguro", bio: Faker::ChuckNorris.fact)
user_1.photo.attach(io: user_1_img, filename: 'jose.png', content_type: 'image/png')

user_2_img = URI.open("https://avatars.githubusercontent.com/u/65900884?v=4")
user_2 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "000000", city: "Shibuya", bio: Faker::ChuckNorris.fact)
user_2.photo.attach(io: user_2_img, filename: 'massim.png', content_type: 'image/png')

user_3_img = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1618401471/nb2bhnpmpj7yhufbzvya.jpg")
user_3 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "000000", city: "Kyodo", bio: Faker::ChuckNorris.fact)
user_3.photo.attach(io: user_3_img, filename: 'machiko.jpg', content_type: 'image/jpg')

user_4_img = URI.open("https://avatars.githubusercontent.com/u/75596027?v=4")
user_4 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "000000", city: "Shimokita", bio: Faker::ChuckNorris.fact)
user_4.photo.attach(io: user_4_img, filename: 'luke.png', content_type: 'image/png')

user_5_img = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1523933095/viqfqp0tfkmcwmj7cfwe.jpg")
user_5 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "000000", city: "Shinjuku", bio: Faker::ChuckNorris.fact)
user_5.photo.attach(io: user_5_img, filename: 'doug.jpg', content_type: 'image/jpg')

pet_1_img = URI.open("https://i.pinimg.com/736x/4d/8e/cc/4d8ecc6967b4a3d475be5c4d881c4d9c.jpg")
pet_1 = Pet.create!(pet_name: Faker::JapaneseMedia::StudioGhibli.character, birthdate: Faker::Date.birthday, species: "cat", breed: "american short hair", description: Faker::ChuckNorris.fact, user: user_1)
pet_1.photo.attach(io: pet_1_img, filename: 'cat1.jpg', content_type: 'image/jpg')

pet_2_img = URI.open("https://cdn.geekwire.com/wp-content/uploads/2021/03/Screen-Shot-2021-03-09-at-4.34.29-PM.png")
pet_2 = Pet.create!(pet_name: Faker::JapaneseMedia::StudioGhibli.character, birthdate: Faker::Date.birthday, species: "cat", breed: "japanese short hair", description: Faker::ChuckNorris.fact, user: user_2)
pet_2.photo.attach(io: pet_2_img, filename: 'cat2.png', content_type: 'image/jpg')

pet_3_img = URI.open("https://i.imgflip.com/4/4t0m5.jpg")
pet_3 = Pet.create!(pet_name: Faker::JapaneseMedia::StudioGhibli.character, birthdate: Faker::Date.birthday, species: "dog", breed: "shibe", description: Faker::ChuckNorris.fact, user: user_3)
pet_3.photo.attach(io: pet_3_img, filename: 'cat3.jpg', content_type: 'image/jpg')

pet_4_img = URI.open("https://i1.sndcdn.com/artworks-000661028899-ypnibo-t500x500.jpg")
pet_4 = Pet.create!(pet_name: Faker::JapaneseMedia::StudioGhibli.character, birthdate: Faker::Date.birthday, species: "dog", breed: "chihuahua", description: Faker::ChuckNorris.fact, user: user_4)
pet_4.photo.attach(io: pet_4_img, filename: 'cat4.jpg', content_type: 'image/jpg')

pet_5_img = URI.open("https://farm9.staticflickr.com/8659/16167077194_d4a7a433d8_b.jpg")
pet_5 = Pet.create!(pet_name: Faker::JapaneseMedia::StudioGhibli.character, birthdate: Faker::Date.birthday, species: "owl", breed: "japanese short hair", description: Faker::ChuckNorris.fact, user: user_5)
pet_5.photo.attach(io: pet_5_img, filename: 'cat5.jpg', content_type: 'image/jpg')

puts "created #{User.count} users #{Pet.count} pets"
