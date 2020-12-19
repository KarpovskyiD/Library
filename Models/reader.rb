# frozen_string_literal: true

class Reader
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    validate_str(name)
    validate_str(email)
    validate_str(city)
    validate_str(street)
    validate_house(house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def validate_str(name)
    raise StandardError, "#{name} is incorrect" unless name.is_a?(String) && name != ''
  end

  def validate_house(house)
    raise StandardError, 'house is incorrect' unless house.is_a?(Integer) && house.positive?
  end

  def to_s
    "#{name} - #{email}. Address: #{city}, #{house} #{street}"
  end
end
