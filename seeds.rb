require_relative './Models/author'
require_relative './Models/book'
require_relative './Models/order'
require_relative './Models/reader'
require_relative './Models/library'

module Seeds
    def self.fill_the_library(library, file_name)
        author1 = Author.new('Dan Brown', 'Bio1')
        author2 = Author.new('Joanne Rowling', 'Bio')
        author3 = Author.new('A.C. Doyle', 'Bio')

        library.authors << author1
        library.authors << author2
        library.authors << author3

        book1 = Book.new('Da Vinci Code', author1)
        book2 = Book.new('Origin', author1)
        book3 = Book.new('Inferno', author1)
        book4 = Book.new("Harry Potter and the Philosopher's Stone", author2)
        book5 = Book.new('Harry Potter and the Chamber of Secrets', author2)
        book6 = Book.new('Harry Potter and the Prisoner of Azkaban', author2)
        book7 = Book.new('Gelseminum as a poison', author3)
        book8 = Book.new('A Scandal in Bohemia', author3)
        book9 = Book.new('The Green Flag', author3)

        library.books << book1
        library.books << book2
        library.books << book3
        library.books << book4
        library.books << book5
        library.books << book6
        library.books << book7
        library.books << book8
        library.books << book9

        reader1 = Reader.new({ name: 'DK', email: 'dk@gmail.com', city: 'D', street: 'street', house: 1 })
        reader2 = Reader.new({ name: 'DM', email: 'dk@gmail.com', city: 'D', street: 'street', house: 1 })
        reader3 = Reader.new({ name: 'DS', email: 'dk@gmail.com', city: 'D', street: 'street', house: 1 })

        library.readers << reader1
        library.readers << reader2
        library.readers << reader3

        order1 = Order.new(book1, reader1)
        order2 = Order.new(book1, reader2)
        order3 = Order.new(book1, reader2)
        order4 = Order.new(book3, reader1)
        order5 = Order.new(book2, reader1)
        order6 = Order.new(book2, reader2)
        order7 = Order.new(book3, reader2)
        order8 = Order.new(book9, reader1)

        library.orders << order1
        library.orders << order2
        library.orders << order3
        library.orders << order4
        library.orders << order5
        library.orders << order6
        library.orders << order7
        library.orders << order8

        library.write_to_yaml(file_name)
    end
end
