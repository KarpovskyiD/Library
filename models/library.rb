# frozen_string_literal: true

require_relative 'author'
require_relative 'book'
require_relative 'order'
require_relative 'reader'
require 'yaml'
require_relative '../validation/validator'

class Library
  include Validator
  attr_reader :books, :orders, :authors, :readers

  def initialize(args = {})
    @authors = args.fetch(:authors, [])
    @books = args.fetch(:books, [])
    @readers = args.fetch(:readers, [])
    @orders = args.fetch(:orders, [])
  end

  def read_from_yaml(file_name = 'library.yml')
    return unless File.exist?(file_name)

    library = YAML.load_file(file_name)
    @authors = library.authors
    @books = library.books
    @orders = library.orders
    @readers = library.readers
  end

  def write_to_yaml(file_name = 'library.yml')
    File.write(file_name, to_yaml)
  end

  def most_popular_reader(elems_num = 1)
    most_popular(elems_num, :reader).map(&:name)
  end

  def count_readers_of_popular_books(elems_num = 3)
    books = most_popular(elems_num, :book)
    @orders.select { |order| books.include? order.book }.map(&:reader).uniq.size
  end

  def most_popular_book(elems_num = 1)
    most_popular(elems_num, :book).map(&:title)
  end

  private

  def most_popular(elements_qty, method)
    @orders.group_by(&method)
           .max_by(elements_qty) { |_, value| value.length }
           .to_h.keys
  end
end
