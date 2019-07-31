require 'fileutils'
require 'pry'

  class Book
    attr_accessor :title, :id
    def initialize(attributes)
      @title = attributes.fetch(:title)
      @id = attributes.fetch(:id)
    end

    def self.all
      returned_books = DB.exec("SELECT * FROM books ORDER BY title;")
      books = []
      returned_books.each() do |book|
        title = book.fetch("title")
        id = book.fetch("id").to_i
        books.push(Book.new({:title => title, :id => id}))
      end
      books
    end

    def ==(book_to_compare)
      self.title() == book_to_compare.title
    end

    def save
      result = DB.exec("INSERT INTO books (title) VALUES ('#{@title}') RETURNING id;")
      @id = result.first().fetch("id").to_i
    end

  end