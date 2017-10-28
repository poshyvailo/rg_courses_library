require 'faker'
require_relative 'classes/author'

authors = []
5.times do
  authors << Author.new(Faker::Book.author, Faker::Lorem.paragraph)
end

puts authors