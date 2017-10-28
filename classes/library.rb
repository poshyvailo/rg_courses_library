require_relative 'author'
require_relative 'book'
require_relative 'reader'
require_relative 'order'

class Library

  attr_accessor :authors, :books, :readers, :orders

  def initialize(authors = [], books = [], readers = [], orders = [])
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  def << (item)
    case item
      when Author
        @authors << item
      when Book
        @books << item
      when Reader
        @readers << item
      when Order
        @orders << item
    end
  end

  def to_s
    output = ''
    output << "Authors:\n"
    @authors.each do |item|
      output << item.to_s + "\n"
    end
    output << "Books:\n"
    @books.each do |item|
      output << item.to_s + "\n"
    end
    output << "Readers:\n"
    @readers.each do |item|
      output << item.to_s + "\n"
    end
    output << "Orders:\n"
    @orders.each do |item|
      output << item.to_s + "\n"
    end
    output
  end

end