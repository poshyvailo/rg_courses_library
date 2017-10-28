require 'faker'
require_relative 'classes/author'
require_relative 'classes/book'
require_relative 'classes/reader'
require_relative 'classes/order'

authors = []
5.times do
  authors << Author.new(Faker::Book.author, Faker::Lorem.paragraph)
end

books = []
5.times do
  books << Book.new(Faker::Book.title, Faker::Book.author)
end

readers = []
5.times do
  readers << Reader.new(
      Faker::Name.name,
      Faker::Internet.email,
      Faker::Address.city,
      Faker::Address.street_name,
      Faker::Address.building_number
  )
end

orders = []

5.times do
  orders << Order.new(Faker::Book.title, Faker::Name.name, Time.now - rand(60*60*24*30))
end

puts "Authors:\n"
puts authors
puts "Books:\n"
puts books
puts "Readers:\n"
puts readers
puts "Orders:\n"
puts orders