# frozen_string_literal: true

class Reader
  attr_reader :name, :email, :city, :street, :house

  def initialize(args)
    validate(args)
    @name = args[:name]
    @email = args[:email]
    @city = args[:city]
    @street = args[:street]
    @house = args[:house]
  end

  def to_s
    "#{name} - #{email}. Address: #{city}, #{house} #{street}"
  end

  private

  def validate_str(name)
    raise StandardError, "#{name} is incorrect" unless name.is_a?(String) && name != ''
  end

  def validate_house(house)
    raise StandardError, 'house is incorrect' unless house.is_a?(Integer) && house.positive?
  end

  def validate(args)
    args.each do |key, value|
      key == :house ? validate_house(value) : validate_str(value)
    end
  end
end
