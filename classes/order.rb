class Order

  attr_accessor :book, :reader, :date

  def initialize (book, reader, date = Time.now)
    @book = book
    @reader = reader
    @date = date
  end

  #todo add book validate
  #todo add reader validate
  #todo add date validate

  def to_s
    "Book: #{book}; Reader: #{reader}; Date: #{date.strftime("%d.%m.%Y %H:%M")}"
  end
end