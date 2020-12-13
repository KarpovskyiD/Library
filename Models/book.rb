require_relative 'author.rb'

class Book
  attr_accessor :title, :autor

  def initialize(title, author)
    @title = title
    @author = author
  end

  def to_s
    "Book: #{title} by #{author}"
  end
end