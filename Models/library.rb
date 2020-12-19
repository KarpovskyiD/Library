require_relative 'Author'
require_relative 'Book'
require_relative 'Order'
require_relative 'Reader'
require 'yaml'

class Library 
  attr_accessor :books, :orders, :authors, :readers

  def initialize(authors = [], books = [], readers = [], orders = [] )
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  def read_from_yaml(file_name = "lib_#{self.object_id}.yml")
    if File.exist?(file_name)
      library = YAML.load_file(file_name)
      @authors = library.authors
      @books = library.books
      @orders = library.orders
      @readers = library.readers
    else
      puts 'There is no such file.'
    end
  end

  def write_to_yaml(file_name = "lib_#{self.object_id}.yml")
    File.new(file_name, 'w') unless File.exist?(file_name)
    File.open(file_name, 'w') { |file| file.write(self.to_yaml) }
  end
end