# frozen_string_literal: true

require_relative 'author'

class Book
  attr_reader :title, :autor

  def initialize(title, author)
    raise StandardError, 'Author is incorrect' unless author.is_a?(Author)
    raise StandardError, 'Title is incorrect' if !title.is_a?(String) || title.empty?

    @title = title
    @author = author
  end
end
