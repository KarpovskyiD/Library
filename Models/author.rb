# frozen_string_literal: true

class Author
  attr_reader :name, :biography

  def initialize(name, biography)
    raise StandardError, 'Name is incorrect' unless name.is_a?(String) && !name.nil? && name != ''

    @name = name
    @biography = biography
  end

  def to_s
    "Name: #{name}:, Biography: #{biography}"
  end
end
