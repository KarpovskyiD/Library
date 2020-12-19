# frozen_string_literal: true

class Reader
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    raise StandardError, 'name is incorrect' unless name.is_a?(String) && name != ''
    raise StandardError, 'email is incorrect' unless email.is_a?(String) && email != ''
    raise StandardError, 'city is incorrect' unless city.is_a?(String) && city != ''
    raise StandardError, 'street is incorrect' unless street.is_a?(String) && steet != ''
    raise StandardError, 'house is incorrect' unless house.is_a?(Integer) && house.positive?

    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def to_s
    "#{name} - #{email}. Address: #{city}, #{house} #{street}"
  end
end
