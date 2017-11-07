# frozen_string_literal: true

# Order class
class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Time.now)
    self.book = book
    self.reader = reader
    self.date = date
  end

  def reader=(reader)
    raise 'The "reader" should be an object of class Reader' unless reader.is_a? Reader
    @reader = reader
  end

  def book=(book)
    raise 'The "book" should be an object of class Book' unless book.is_a? Book
    @book = book
  end

  def date=(date)
    @date = if date.is_a? Time
              date
            else
              begin
                Date.parse(date)
              rescue ArgumentError
                @date = Time.now
              end
            end
  end

  def to_s
    "Book: #{book}; Reader: #{reader}; Date: #{date.strftime('%d.%m.%Y %H:%M')}"
  end
end
