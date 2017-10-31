# frozen_string_literal: true

# Author class
class Author
  attr_accessor :biography
  attr_reader :name

  def initialize(name, biography)
    self.name = name
    self.biography = biography
  end

  def name=(name)
    raise 'Empty author name' if name.to_s.empty? || name.nil?
    @name = name
  end

  def to_s
    "Author name: #{name}; Author biography: #{biography}"
  end
end