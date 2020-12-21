# frozen_string_literal: true

require_relative 'author'
require_relative 'book'
require_relative 'order'
require_relative 'reader'
require 'yaml'

class Library
  attr_reader :books, :orders, :authors, :readers

  def initialize(authors, books, readers, orders)
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  def read_from_yaml(file_name = 'library.yml')
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

  def write_to_yaml(file_name = 'library.yml')
    File.delete(file_name) if File.exist?(file_name)
    File.new(file_name, 'w')
    File.open(file_name, 'w') { |file| file.write(to_yaml) }
  end

  def most_popular_reader(elems_num = 1)
    result = most_popular(elems_num, :reader)
    result.map(&:name)
  end

  def count_readers_of_popular_books(elems_num = 3)
    books = most_popular(elems_num, :book)
    @orders.select { |order| books.include? order.book }.map(&:reader).uniq.size
  end

  def most_popular_book(elems_num = 1)
    result = most_popular(elems_num, :book)
    result.map(&:title)
  end

  private

  def most_popular(elements_qty, method)
    @orders.group_by(&method)
           .max_by(elements_qty) { |_, value| value.length }
           .to_h.keys
  end
end
