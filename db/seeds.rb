# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email:'mate.qac@gmail.com', password:'Testing123', username: 'Mathew')
user2 = User.create(email:'user2@gmail.com', password:'Testing123', username: 'Pedro')
user3 = User.create(email:'user3@gmail.com', password:'Testing123', username: 'Carlos')
user4 = User.create(email:'user4@gmail.com', password:'Testing123', username: 'Raul')
user5 = User.create(email:'user5@gmail.com', password:'Testing123', username: 'Jorge')
