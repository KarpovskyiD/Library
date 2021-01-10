# frozen_string_literal: true

require_relative './Models/author'
require_relative './Models/book'
require_relative './Models/order'
require_relative './Models/reader'
require_relative './Models/library'
require_relative 'seeds'

library = Library.new([], [], [], [])
file_name = 'library.yml'

Seeds.fill_the_library(library, file_name)

author4 = Author.new('Chuck Palahniuk', 'bio')
library.authors << author4
book10 = Book.new('Fight club', author4)
library.books << book10
reader4 = Reader.new({ name: 'DT', email: 'ds@gmail.com', city: 'D', street: 'street', house: 1 })
library.readers << reader4
order9 = Order.new(book10, reader4)
library.orders << order9

library.write_to_yaml(file_name)

library1 = Library.new([], [], [], [])
library1.read_from_yaml(file_name)

puts "Most popular readers: #{library1.most_popular_reader.join(', ')}."
puts "Most popular books: #{library1.most_popular_book.join(', ')}."
puts 'Number of Readers of the Most Popular Books: '\
     "#{library1.count_readers_of_popular_books(1)}."
