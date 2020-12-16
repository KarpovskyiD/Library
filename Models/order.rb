require_relative 'book.rb'
require_relative 'reader.rb'

class Order
  attr_accessor :book, :reader, :date

  def initialize(book, reader, date = Time.now)
    raise StandardError.new "book is incorrect" unless book.is_a?(Book)
    raise StandardError.new "reader is incorrect" unless reader.is_a?(Reader)
    raise StandardError.new "date is incorrect" unless date.is_a?(Time)
    @book = book
    @reader = reader
    @date = date
  end

  def to_s
    "Book: #{book}, Reader: #{reader.name}, "\
    "Date: #{@date.strftime('%Y %b %d, %H:%M')}"
  end
end