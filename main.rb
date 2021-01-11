# frozen_string_literal: true

require_relative './models/author'
require_relative './models/book'
require_relative './models/order'
require_relative './models/reader'
require_relative './models/library'
require_relative 'seeds'

library = Library.new
file_name = 'library.yml'

Seeds.fill_the_library(library, file_name)

author = Author.new('Chuck Palahniuk', 'bio')
library.authors << author
book = Book.new('Fight club', author)
library.books << book
reader = Reader.new({ name: 'DT', email: 'ds@gmail.com', city: 'D', street: 'street', house: 1 })
library.readers << reader
order = Order.new(book, reader)
library.orders << order

library.write_to_yaml(file_name)
library.read_from_yaml(file_name)

puts "Most popular readers: #{library.most_popular_reader.join(', ')}."
puts "Most popular books: #{library.most_popular_book.join(', ')}."
puts 'Number of Readers of the Most Popular Books: '\
     "#{library.count_readers_of_popular_books(1)}."
