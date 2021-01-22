# frozen_string_literal: true

class WrongClassError < StandardError
  def initialize
    super('Wrong class')
  end
end
