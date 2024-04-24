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

User.create(name: 'Aoi', email: 'b@b.com', encrypted_password: 'aaaaaa', is_active: true)
User.create(name: 'ひまり', email: 'c@c.com', encrypted_password: 'aaaaaa', is_active: true)
User.create(name: '律', email: 'd@d.com', encrypted_password: 'aaaaaa', is_active: true)
User.create(name: 'mei', email: 'e@e.com', encrypted_password: 'aaaaaa', is_active: true)
User.create(name: 'なぎ', email: 'f@f.com', encrypted_password: 'aaaaaa', is_active: true)