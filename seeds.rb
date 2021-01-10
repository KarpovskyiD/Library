# frozen_string_literal: true

require_relative './models/author'
require_relative './models/book'
require_relative './models/order'
require_relative './models/reader'
require_relative './models/library'
require_relative 'seeds'

module Seeds
  def self.fill_the_library(library, file_name)
    authors = ['Dan Brown', 'Joanne Rowling', 'A.C. Doyle']
    books = ['Da Vinci Code', 'Origin', 'Inferno', "Harry Potter and the Philosopher's Stone",
             'Harry Potter and the Chamber of Secrets', 'Harry Potter and the Prisoner of Azkaban',
             'Gelseminum as a poison', 'A Scandal in Bohemia', 'The Green Flag']
    readers = %w[DK DM DS]
    add_authors(library, authors)
    add_books(library, books)
    add_readers(library, readers)
    add_orders(library)
    library.write_to_yaml(file_name)
  end

  def self.add_authors(library, list)
    list.each do |aut|
      author = Author.new(aut, 'bio')
      library.authors << author
    end
  end

  def self.add_books(library, list)
    list.each do |b|
      book = Book.new(b, library.authors.sample)
      library.books << book
    end
  end

  def self.add_readers(library, list)
    list.each do |r|
      reader = Reader.new({ name: r, email: 'dk@gmail.com', city: 'D', street: 'street', house: 1 })
      library.readers << reader
    end
  end

  def self.add_orders(library)
    (0..7).each do |_i|
      order = Order.new(library.books.sample, library.readers.sample)
      library.orders << order
    end
  end
end
