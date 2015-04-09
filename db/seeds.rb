

users = User.create([{name: "Andrew Miksch", handle: "superandrew", email: "andrew@email.com", password: "password"}, 
  {name: "Laura Hines", handle: "laurahines22", email: "laura@email.com", password: "password"},
  {name: "Maureen Johnson", handle: "MoPj", email: "maureen@email.com", password: "password"},
  {name: "Ville Vesterinen", handle: "ville", email: "ville@email.com", password: "password"},
  {name: "Duane Johnson", handle: "theRock", email: "rock@email.com", password: "password"},
  {name: "Kurt Russell", handle: "KurtyPants", email: "kurt@email.com", password: "password"},
  {name: "Bruce Springsteen", handle: "theBoss", email: "Boss@email.com", password: "password"},
  {name: "Jada Pinkett Smith", handle: "Jada", email: "jada@email.com", password: "password"},
  {name: "Taylor Swift", handle: "SoSwift", email: "taylor@email.com", password: "password"},
  {name: "Karlie Kloss", handle: "TheKloss", email: "Karlie@email.com", password: "password"},])

# users.each do |user|
#  = User.find_by_id(id)
# and then create it based on that e.g.
i = 1
array_ids = User.all.pluck(:id)
    binding.pry
  array_ids.each do |user|
    post.user_id = user
    post.post_content = "test post content"
    post.save
    i +=1

  end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
