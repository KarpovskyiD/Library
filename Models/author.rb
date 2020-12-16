class Author
  attr_accessor :name, :biography

  def initialize(name, biography)
    raise StandardError.new "Name is incorrect" unless name.is_a?(String) && name != nil && name != ""
    @name = name
    @biography = biography
  end

  def to_s
    "Name: #{name}:, Biography: #{biography}"
  end
end