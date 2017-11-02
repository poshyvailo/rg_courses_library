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
    rating('reader').first
  end

  def popular_book
    rating('book').first
  end

  def counts_reader_popular_books
    result = Hash.new(0)
    rating('book').first(3).each do |book|
      count = orders.select do |order|
        order.book.title == book[0].to_s
      end
      result[:"#{book[0].to_s}"] = count.uniq { |o| o.reader.name }.count
    end
    result
  end

  private

  def rating(field)
    case field.to_s
    when 'book'
      attr = :title
    when 'reader'
      attr = :name
    else
      raise "Wrong argument of rating method! (#{key})"
    end
    rating_list(field, attr).sort_by { |__, value| value }.reverse
  end

  def rating_list(field, attr)
    orders.each_with_object(Hash.new(0)) do |order, count|
      count[:"#{order.public_send(field.to_sym).public_send(attr)}"] += 1
    end
  end
end