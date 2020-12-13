require_relative 'book.rb'
require_relative 'reader.rb'

class Order
  attr_accessor :book, :reader, :date

  def initialize(book, reader, date)
    @book = book
    @reader = reader
    @date = date
  end
end