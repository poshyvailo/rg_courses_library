require 'faker'
require_relative 'classes/library'

lib = Library.new

5.times do
  lib << Author.new(Faker::Book.author, Faker::Lorem.paragraph)
end

5.times do
  lib << Book.new(Faker::Book.title, Faker::Book.author)
end

5.times do
  lib << Reader.new(
      Faker::Name.name,
      Faker::Internet.email,
      Faker::Address.city,
      Faker::Address.street_name,
      Faker::Address.building_number
  )
end

5.times do
  lib << Order.new(Faker::Book.title, Faker::Name.name, Time.now - rand(60*60*24*30))
end



puts "Library:\n"
puts lib
