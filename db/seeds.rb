# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Mock admin
User.create(
    name: 'admin',
    email: 'admin@meme.com',
    password: 'pass123',
    password_confirmation: 'pass123',
    role: 'admin',
    confirmed_at: DateTime.now
)

# Mock user
User.create(
    name: 'memeMaster99',
    email: 'user@meme.com',
    password: 'pass123',
    password_confirmation: 'pass123',
    confirmed_at: DateTime.now
)

User.create(
    name: 'meme machine',
    email: 'user1@meme.com',
    password: 'pass123',
    password_confirmation: 'pass123',
    confirmed_at: DateTime.now
)