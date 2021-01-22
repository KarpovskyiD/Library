# frozen_string_literal: true

require_relative 'empty_string_error'
require_relative 'negative_number_error'
require_relative 'wrong_class_error'

module Validator
  def empty_string(string)
    raise EmptyStringError if string.empty?
  end

  def correct_argument_type(object, expected_class)
    raise WrongClassError unless object.is_a?(expected_class)
  end

  def negative_number(number)
    raise NegativeNumberError unless number.positive?
  end
end
