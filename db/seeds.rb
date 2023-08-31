# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.where(email: 'test@test.com').first_or_initialize

user.update!(
  password: 111111,
  password_confirmation: 111111,
  email: 'test@test.com', 
  name: 'test', 
  bio: 'test', 
  photo: 'https://randomuser.me/api/portraits/men/2.jpg'
)