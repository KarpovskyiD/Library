# frozen_string_literal: true

require_relative '../validation/validator'

class Author
  include Validator
  attr_reader :name, :biography

  def initialize(name, biography)
    validate(name, biography)
    @name = name
    @biography = biography
  end

  private

  def validate(author_name, biography)
    validate_name(author_name)
    validate_biography(biography)
  end

  def validate_name(author_name)
    correct_argument_type(author_name, String)
    empty_string(author_name)
  end

  def validate_biography(biography)
    correct_argument_type(biography, String)
  end
end
