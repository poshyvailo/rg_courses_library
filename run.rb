# frozen_string_literal: true

require 'faker'
require_relative 'classes/library'

lib = Library.new

#Test author wrong data
author = Author.new('', 'bio') #Error
# puts Author.new(nil, 'bio') #Error
# puts Author.new(123, 'bio')
# puts Author.new("Fred", nil)
# author = Author.new("Fred", 'bio')

puts author.name

#Test book wrong data
# puts Book.new('', author)
# puts Book.new(nil, author)
# puts Book.new('Book title', 'author')
# puts Book.new('Book title', nil)
# book = Book.new('Ruby Book', author)

# puts book

#Test reader wrong data

# 5.times do
#   lib << Author.new(Faker::Book.author, Faker::Lorem.paragraph)
# end
#
# 5.times do
#   lib << Book.new(Faker::Book.title, Faker::Book.author)
# end
#
# 5.times do
#   lib << Reader.new(
#       Faker::Name.name,
#       Faker::Internet.email,
#       Faker::Address.city,
#       Faker::Address.street_name,
#       Faker::Address.building_number
#   )
# end
#
# 5.times do
#   lib << Order.new(Faker::Book.title, Faker::Name.name, Time.now - rand(60*60*24*30))
# end

# puts "Library:\n"
# puts lib
