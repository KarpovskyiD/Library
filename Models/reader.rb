class Reader
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    raise StandardError.new "name is incorrect" unless name.is_a?(String) && name != ""
    raise StandardError.new "email is incorrect" unless email.is_a?(String) && email != ""
    raise StandardError.new "city is incorrect" unless city.is_a?(String) && city != ""
    raise StandardError.new "street is incorrect" unless street.is_a?(String) && steet != ""
    raise StandardError.new "house is incorrect" unless house.is_a?(Integer) && house > 0
    
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