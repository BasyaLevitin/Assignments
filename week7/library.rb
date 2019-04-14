class Library

    @@my_books = []
    attr_accessor :bName, :bAuthor, :isbn
    def initialize(name, author,bisbn)
      @bName = name
      @bAuthor = author
      @isbn = bisbn
    end

    def self.add_book(name, author,bisbn)
      new_book = Library.new(name,author,bisbn)
      @@my_books << new_book
      return new_book
    end
    def self.show_books
        return @@my_books
    end
end

my_first_book = Library.new("Harry Potter","J K Rowling",123456789)

Library.add_book("Harry Potter2","J K Rowling",12345678999)
a=  Library.add_book("Harry Potter3","J K Rowling",12345678999)
puts a.inspect
Library.add_book("Harry Potter4","J K Rowling",12345678999)
Library.add_book("Harry Potter5","J K Rowling",12345678999)

p Library.show_books
