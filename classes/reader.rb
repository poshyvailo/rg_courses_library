# frozen_string_literal: true

# Reader class
class Reader
  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, address = {})
    self.name = name
    self.email = email
    self.city = address[:city]
    self.street = address[:street]
    self.house = address[:house]
  end

  def name=(name)
    raise 'Empty reader name' if name.to_s.empty? || name.nil?
    @name = name
  end

  def city=(city)
    raise 'Empty reader city' if city.to_s.empty? || city.nil?
    @city = city
  end

  def street=(street)
    raise 'Empty reader street' if street.to_s.empty? || street.nil?
    @street = street
  end

  def house=(house)
    raise 'Empty reader house' if house.to_s.empty? || house.nil?
    @house = house
  end

  def email=(email)
    raise 'Empty reader email' if email.to_s.empty? || email.nil?
    raise 'Email not valid' unless valid_email? email
    @email = email
  end

  def to_s
    "Reader name: #{name}; Email: #{email}; Address: #{city}, #{street}, #{house}"
  end

  private

  def valid_email?(email)
    email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  end
end
