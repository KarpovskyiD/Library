# frozen_string_literal: true

class Author
  attr_accessor :name, :biography

  def initialize(name, biography)
    raise StandardError, 'Name is incorrect' unless name.is_a?(String) && !name.nil? && name.present?

    @name = name
    @biography = biography
  end

  def to_s
    "Name: #{name}:, Biography: #{biography}"
  end
end
