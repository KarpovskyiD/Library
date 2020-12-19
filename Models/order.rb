# frozen_string_literal: true

require_relative 'book'
require_relative 'reader'

class Order
  attr_accessor :book, :reader, :date

  def initialize(book, reader, date = Time.now)
    raise StandardError, 'book is incorrect' unless book.is_a?(Book)
    raise StandardError, 'reader is incorrect' unless reader.is_a?(Reader)
    raise StandardError, 'date is incorrect' unless date.is_a?(Time)

    @book = book
    @reader = reader
    @date = date
  end

  def to_s
    "Book: #{book}, Reader: #{reader.name}, "\
    "Date: #{@date.strftime('%Y %b %d, %H:%M')}"
  end
end
