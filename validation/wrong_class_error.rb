class WrongClassError < StandardError
  def initialize
    super('Wrong class')
  end
end
