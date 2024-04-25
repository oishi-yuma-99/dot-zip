# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
#   email: 'z@z.com',
#   password: 'aaaaaa'
# )

User.create(name: 'Aoi', account_name: 'aoi1234', email: 'b@b.com', password: 'aaaaaa', is_active: true)
User.create(name: 'ひまり', account_name: 'himari1234', email: 'c@c.com', password: 'aaaaaa', is_active: true)
User.create(name: '律', account_name: 'ritsu1234', email: 'd@d.com', password: 'aaaaaa', is_active: true)
User.create(name: 'mei', account_name: 'mei1234', email: 'e@e.com', password: 'aaaaaa', is_active: true)
User.create(name: 'なぎ', account_name: 'nagi1234', email: 'f@f.com', password: 'aaaaaa', is_active: true)