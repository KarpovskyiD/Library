# frozen_string_literal: true

require_relative '../validation/validator'
require_relative 'author'

class Book
  include Validator
  attr_reader :title, :author

  def initialize(title, author)
    validate(title, author)
    @title = title
    @author = author
  end

  private

  def validate(title, author)
    validate_title(title)
    validate_author(author)
  end

  def validate_author(author)
    correct_argument_type(author, Author)
  end

  def validate_title(title)
    correct_argument_type(title, String)
    empty_string(title)
  end
end
