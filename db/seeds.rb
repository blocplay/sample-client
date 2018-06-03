# This file should contain all the record creation needed to seed the database
# ith its default values. The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create!(
  name: 'Heavy Gear Assault',
  description: 'The world of Heavy Gear Assault is unforgiving — but so is your lust for glory. As a pilot on the distant planet Terra Nova, you play the high-stakes game of competitive Gear Dueling.',
  price: Money.new(98_500, 'THB'),
  image_url: 'https://steamcdn-a.akamaihd.net/steam/apps/416020/header.jpg?t=1500568474'
)

Product.create!(
  name: 'Half Life',
  description: 'Named Game of the Year by over 50 publications, Valves debut title blends action and adventure with award-winning technology to create a frighteningly realistic world where players must think to survive. Also includes an exciting multiplayer mode that allows you to play against friends and enemies ',
  price: Money.new(15_500, 'THB'),
  image_url: 'https://steamcdn-a.akamaihd.net/steam/apps/70/header.jpg?t=1493762285'
)

Product.create!(
  name: 'Portal 2',
  description: 'The Perpetual Testing Initiative has been expanded to allow you to design co-op puzzles for you and your friends!',
  price: Money.new(45_000, 'THB'),
  image_url: 'https://steamcdn-a.akamaihd.net/steam/apps/620/header.jpg?t=1512411524'
)
