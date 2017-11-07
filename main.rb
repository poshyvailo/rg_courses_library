# frozen_string_literal: true

require 'faker'
require_relative 'classes/storage'
require_relative 'classes/library'

def generate(library)
  10.times { library << Author.new(Faker::Book.author, Faker::Lorem.paragraph) }
  30.times { library << Book.new(Faker::Book.title, library.authors.sample) }
  30.times do
    library << Reader.new(Faker::Name.name,
                          Faker::Internet.email,
                          city: Faker::Address.city,
                          street: Faker::Address.street_name,
                          house: Faker::Address.building_number)
  end
  500.times do
    library << Order.new(library.books.sample,
                         library.readers.sample,
                         Time.now - rand(60 * 60 * 24 * 30))
  end
end

library = Library.new

if Storage.storage_exist?
  library = Storage.load
else
  generate(library)
end

print 'Who often takes the book? - '
reader = library.often_takes
puts "Reader \"#{reader[0]}\" takes #{reader[1]} books"

print 'What is the most popular book? - '
book = library.popular_book
puts "The most popular book \"#{book[0]}\", #{book[1]} takes"

puts 'How many people ordered one of the three most popular books?'
books = library.counts_reader_popular_books
books.each do |item|
  puts "\"#{item[0]}\" - #{item[1]}"
end

# p library.book_rating_list

Storage.save(library)
