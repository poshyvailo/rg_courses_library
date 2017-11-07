# frozen_string_literal: true

require_relative 'author'
require_relative 'book'
require_relative 'reader'
require_relative 'order'

# Library class
class Library
  attr_reader :authors, :books, :readers, :orders

  def initialize(authors = [], books = [], readers = [], orders = [])
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  def <<(item)
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
      raise "The object \"#{item}\" does not have the appropriate class"
    end
  end

  def often_takes
    reader_rating_list.first
  end

  def popular_book
    book_rating_list.first
  end

  def counts_reader_popular_books
    book_list = book_rating_list.first(3).to_h
    book_list.each_key.with_object(Hash.new(0)) do |book_title, result|
      result[book_title.to_s] = book_readers(book_title)
    end
  end

  private

  def book_readers(book_title)
    all_readers = orders.select do |order|
      order.book.title == book_title.to_s
    end
    all_readers.uniq { |order| order.reader.name }.count
  end

  def book_rating_list
    list = orders.each_with_object(Hash.new(0)) do |order, rating|
      rating[:"#{order.book.title}"] += 1
    end
    list.sort_by { |__, value| value }.reverse
  end

  def reader_rating_list
    list = orders.each_with_object(Hash.new(0)) do |order, rating|
      rating[:"#{order.reader.name}"] += 1
    end
    list.sort_by { |__, value| value }.reverse
  end
end