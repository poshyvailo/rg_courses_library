# frozen_string_literal: true

# Order class
class Order
  attr_accessor :book, :reader, :date

  def initialize(book, reader, date = Time.now)
    @book = book
    @reader = reader
    @date = date
  end

  # TODO: add book validate
  # TODO: add reader validate
  # TODO: add date validate

  def to_s
    "Book: #{book}; Reader: #{reader}; Date: #{date.strftime('%d.%m.%Y %H:%M')}"
  end
end
