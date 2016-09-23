# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

name = Faker::Name.name
email = Faker::Internet.free_email
username = Faker::Internet.user_name
zip = Faker::Address.zip
address = Faker::Address.street_address
city = "Miami"
state = "Florida"
image = Faker::Avatar.image

@post = Post.all

20.times do
  @users = User.create!(name: Faker::Name.name, email: Faker::Internet.free_email, username: Faker::Internet.user_name, address: Faker::Address.street_address, city: "Miami", state: "FL", zip: zip, image: Faker::Avatar.image, password: Faker::Internet.password)
end

User.all.each do |person|
  person.pets.create!(name: Faker::Name.name, breed: "Pitbull", info: Faker::Hipster.sentence, image: Faker::Avatar.image)
  person.posts.create!(caption: Faker::Hipster.sentence, image: Faker::Avatar.image, pet_id: person.pets.first.id)
  person.comments.create!(post_id: @post.sample, content: Faker::Hacker.say_something_smart)
end
