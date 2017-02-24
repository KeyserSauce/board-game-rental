# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
games = [
  "Chess",
  "Monopoly",
  "Scrabble",
  "Risk",
  "Settlers of Catan",
  "Clue",
  "Ticket to Ride",
  "Uno",
  "Battleship",
  "Apples to Apples",
  "Dominion",
  "Puerto Rico",
  "Yahtzee",
  "Trivial Pursuit",
  "Stratego",
  "Checkers",
  "Sorry",
  "Agricola",
  "Carcassonne",
  "Pictionary",
  "Pandemic",
  "Connect Four",
  "Go",
  "Backgammon",
  "Arkham Horror",
  "Axis and Allies",
  "Power Grid",
  "The Game of Life",
  "Candyland",
  "A Game of Thrones",
  "Battlestar Galactica",
  "Cosmic Encounter",
  "Smallworld",
  "Twilight Struggle",
  "Trouble",
  "Tigris and Euphrates",
  "7 Wonders",
  "Twilight Imperium",
  "Chinese Checkers",
  "Mastermind",
  "Cranium",
  "El Grande",
  "Dont Break the Ice",
  "Scattergories",
  "Dixit",
  "Mahjong",
  "Say Anything",
  "Dominoes",
  "Dominant Species",
  "Cards Against Humanity",
  "Guess Who",
  "Dungeon",
  "Reversi Othello",
  "Mancala",
  "The Invasion of Canada",
  "Taboo",
  "Diplomacy",
  "Descent Journeys in the Dark",
  "Hi Ho Cherry O",
  "Wits and Wagers",
  "Caylus",
  "Key to the Kingdom",
  "Chutes and Ladders",
  "Blood Bowl",
  "Uno Attack",
  "Shogun",
  "Operation",
  "Through the Ages",
  "Pay Day",
  "Shadows Over Camelot",
  "Alhambra",
  "Balderdash",
  "Le Havre",
  "Acquire",
  "Scotland Yard",
  "Summoner Wars"
]


def get_photo_url(name)
  name = name.strip.gsub(" ","+")
  results = Nokogiri::HTML(open("https://www.google.dk/search?q=#{name}+game&rlz=1C5CHFA_enUS720US721&espv=2&biw=1280&source=lnms&tbm=isch&sa=X&ved=0ahUKEwiHr_nZz6jSAhXH0hoKHRMOAqwQ_AUICCgB&bih=652"))
  url = results.css('a')[35].children[0]["src"]
end

Create users
20.times do
  user                    = User.new
  user.email              = Faker::Internet.email
  user.password           = Faker::Internet.password.to_s
  user.save!
end

# Create games
games.each do |g|
  puts games
  game                    = Game.new
  game.name               = g
  game.user               = User.order("RANDOM()").first
  game.description        = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae libero ac arcu consequat feugiat. Cras justo ipsum, egestas at volutpat in, fermentum sed est. Cras dolor lacus, vestibulum sit amet malesuada in, viverra sit amet sapien. Morbi non augue volutpat, tempor erat et, rhoncus lorem. Aenean efficitur sollicitudin libero sit amet pellentesque. Nunc sollicitudin risus at mauris imperdiet commodo. Nullam imperdiet dictum sem, quis elementum quam. Duis euismod tristique magna scelerisque tempus. Donec ligula diam, varius at eleifend venenatis, venenatis ut nisi. Morbi cursus nulla vitae lacinia iaculis. Aliquam pharetra quis elit nec faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean vitae mauris vitae odio molestie dapibus et eget metus."
  game.category           = ["family", "card", "german", "children", "drinking", "group"].sample
  game.photo_url          = get_photo_url(g)
  game.price              = rand(2..10)
  game.save!
end


12.times do
  rental                  = Rental.new
  rental.start_date       = Date.today
  rental.end_date         = Date.today
  rental.user_id          = User.order("RANDOM()").first.id
  rental.game_id          = Game.order("RANDOM()").first.id
  rental.save!
end


