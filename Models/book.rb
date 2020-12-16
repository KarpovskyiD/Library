require_relative 'author.rb'

class Book
  attr_accessor :title, :autor

  def initialize(title, author)
    raise StandardError.new "Author is incorrect" unless author.is_a?(Author)
    raise StandardError.new "Title is incorrect" unless title.is_a?(String) && title != "" 
    @title = title
    @author = author
  end

  def to_s
    "Book: #{title} by #{author}"
  end
end