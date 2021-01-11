# frozen_string_literal: true

require_relative 'book'
require_relative 'reader'
require_relative '../validation/validator'

class Order
  include Validator
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Time.now)
    validate(book, reader, date)
    @book = book
    @reader = reader
    @date = date
  end

  private

  def validate(book, reader, date)
    validate_book(book)
    validate_reader(reader)
    validate_date(date)
  end

  def validate_book(book)
    correct_argument_type(book, Book)
  end

  def validate_reader(reader)
    correct_argument_type(reader, Reader)
  end

  def validate_date(date)
    correct_argument_type(date, Time)
  end
end
