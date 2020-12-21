# frozen_string_literal: true

require_relative 'author'

class Book
  attr_reader :title, :autor

  def initialize(title, author)
    raise StandardError, 'Author is incorrect' unless author.is_a?(Author)
    raise StandardError, 'Title is incorrect' unless title.is_a?(String) && title != ''

    @title = title
    @author = author
  end

  def to_s
    "Book: #{title} by #{author}"
  end
end
