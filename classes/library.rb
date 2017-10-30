require_relative 'author'
require_relative 'book'
require_relative 'reader'
require_relative 'order'

class Library

  attr_reader :authors, :books, :readers, :orders

  def initialize()
    @authors = []
    @books = []
    @readers = []
    @orders = []
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
      else
        raise 'Wrong item class!'
    end
  end

  def to_s
    output = ''
    instance_variables.each do |variable|
      variable = variable.to_s.sub(/^@/, '')
      output << variable.capitalize + ":\n"
      send(variable).each do |item|
        output << item.to_s + "\n"
      end
    end
    output
  end

  # Who often takes the book
  def often_takes
    counts = Hash.new(0)
    orders.each { |item| counts[:"#{item.reader.name}"] += 1 }
    counts.sort_by {|key, value| value}.reverse.first

    #todo Учесть возможность того что несколько человек может взять одинаковое кол-во книг!
  end

  # What is the most popular book
  def popular_book
    counts = Hash.new(0)
    orders.each { |item| counts[:"#{item.book.title}"] += 1 }
    counts.sort_by {|key, value| value}.reverse.first
    #todo Учесть возможность того что несколько человек может взять одинаковое кол-во книг!
  end

  # How many people ordered one of the three most popular books
  def reader_popular_books
    counts = Hash.new(0)
    orders.each { |item| counts[:"#{item.book.title}"] += 1 }
    counts.sort_by {|key, value| value}.reverse.each { |key, value|
        count_readers = Hash.new(0)
        orders.each { |item|
          count_readers[:"#{item.reader.name}"] += 1  if key.to_s == item.book.title
        }
        counts[key] = count_readers.count
    }
    counts
  end

end