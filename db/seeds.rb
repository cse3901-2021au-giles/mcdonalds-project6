# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(username: "admin1",email: "admin1@osu.edu", password: "pw", created_at: Date.today, updated_at: Date.today)
User.create(username: "user1",email: "user1@osu.edu", password: "pw", created_at: Date.today, updated_at: Date.today)