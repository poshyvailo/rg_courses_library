# frozen_string_literal: true

# Book class
class Book
  attr_reader :title, :author

  def initialize(title, author)
    self.title = title
    self.author = author
  end

  def title=(title)
    raise 'Empty book title' if title.to_s.empty? || title.nil?
    @title = title
  end

  def author=(author)
    unless author.is_a? Author
      raise 'The "author" should be an object of class Author'
    end
    @author = author
  end

  def to_s
    "Book title: #{title}; Book author: #{author}"
  end
end