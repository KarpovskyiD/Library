# frozen_string_literal: true
require_relative '../validation/validator'

class Reader
  include Validator
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

  def validate_str(item)
    correct_argument_type(item, String)
    empty_string(item)
  end

  def validate_house(house)
    correct_argument_type(house, Integer)
    negative_number(house)
  end

  def validate(args)
    args.each do |key, value|
      key == :house ? validate_house(value) : validate_str(value)
    end
  end
end
