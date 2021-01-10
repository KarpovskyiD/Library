# frozen_string_literal: true

class Author
  attr_reader :name, :biography

  def initialize(name, biography)
    raise StandardError, 'Name is incorrect' if !name.is_a?(String) || name.nil? && name.empty?

    @name = name
    @biography = biography
  end
 