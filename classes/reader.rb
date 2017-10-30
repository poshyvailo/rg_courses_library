class Reader

  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  #todo name validate
  #todo email validate
  #todo city validate
  #todo street validate
  #todo house validate

  def to_s
    "Reader name: #{name}; Email: #{email}; Address: #{city}, #{street}, #{house}"
  end
end