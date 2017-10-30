require 'faker'
require_relative 'classes/storage'
require_relative 'classes/library'

def generate (library)
  # 10.times { library << Author.new(Faker::Book.author, Faker::Lorem.paragraph) }
  # 30.times { library << Book.new(Faker::Book.title, library.authors.sample) }
  # 30.times {
  #   library << Reader.new(
  #       Faker::Name.name,
  #       Faker::Internet.email,
  #       Faker::Address.city,
  #       Faker::Address.street_name,
  #       Faker::Address.building_number
  #   )
  # }
  # 500.times {
  #   library <<  Order.new(
  #       library.books.sample,
  #       library.readers.sample,
  #       Time.now - rand(60*60*24*30)
  #   )
  # }

  3.times { |i| library << Author.new("Author ##{i}", "bio") }
  2.times { |i| library << Book.new("Book ##{i}", library.authors.sample) }
  2.times { |i|
    library << Reader.new(
        "Reader ##{i}",
        Faker::Internet.email,
        Faker::Address.city,
        Faker::Address.street_name,
        Faker::Address.building_number
    )
  }
  10.times {
    library <<  Order.new(
        library.books.sample,
        library.readers.sample,
        Time.now - rand(60*60*24*30)
    )
  }
end


library = Library.new
if Storage::storage_exist?
  library = Storage::load
else
  generate(library)
end

# puts library.reader_popular_books

puts "Who often takes the book?"
reader = library.often_takes
puts "Reader #{reader[0]} takes #{reader[1]} books"

puts "What is the most popular book"
book =  library.popular_book
puts "The most popular book \"#{book[0]}\", #{book[1]} takes"

puts "How many people ordered one of the three most popular books"
books = library.reader_popular_books
books.each do |book|
  puts "\"#{book[0]}\" - #{book[1]}"
end

# Storage::save(library)
