# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
12.times do
  user                    = User.new
  user.email              = Faker::Internet.email
  user.password           = Faker::Internet.password.to_s
  user.save!
end

user_count = User.all.count

12.times do
  game                    = Game.new
  game.name               = Faker::App.name
  game.user               = User.order("RANDOM()").first
  game.description        = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae libero ac arcu consequat feugiat. Cras justo ipsum, egestas at volutpat in, fermentum sed est. Cras dolor lacus, vestibulum sit amet malesuada in, viverra sit amet sapien. Morbi non augue volutpat, tempor erat et, rhoncus lorem. Aenean efficitur sollicitudin libero sit amet pellentesque. Nunc sollicitudin risus at mauris imperdiet commodo. Nullam imperdiet dictum sem, quis elementum quam. Duis euismod tristique magna scelerisque tempus. Donec ligula diam, varius at eleifend venenatis, venenatis ut nisi. Morbi cursus nulla vitae lacinia iaculis. Aliquam pharetra quis elit nec faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean vitae mauris vitae odio molestie dapibus et eget metus."
  game.save!
end

game_count = Game.all.count

12.times do
  rental                  = Rental.new
  rental.start_date       = Date.today
  rental.end_date         = Date.today
  rental.user_id          = User.order("RANDOM()").first.id
  rental.game_id          = Game.order("RANDOM()").first.id
  rental.save!
end

