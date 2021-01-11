class NegativeNumberError < StandardError
  def initialize
    super('Number is negative')
  end
end
