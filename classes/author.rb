class Author

  attr_accessor :biography
  attr_reader :name

  def initialize(name, biography)
    self.name = name
    self.biography = biography
  end

  def name=(name)
    if name.to_s.empty? || name.nil?
      raise "Empty author name"
    end
    @name = name
  end

  def to_s
    "Author name: #{name}; Author biography: #{biography}"
  end
end