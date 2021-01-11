class EmptyStringError < StandardError
  def initialize
    super('String must be not empty')
  end
end
