require 'spec_helper'

describe '#Book' do

  # before(:each) do
  #     @book = Book.new({:title => "The Sign of Three", :id => nil})
  #     @book.save()
  # end

  describe('#Book') do
    it('creates an Book object and accurately stores the properties and new id') do
      book1 = Book.new({:title => "The Sign of Three", :id => 1})
      expect(book1.title).to(eq("The Sign of Three"))
      expect(book1.id).to(eq(1))
    end
  end

  describe('.all') do
    it("returns and empty array where there are no authors") do
      expect(Book.all).to(eq([]))
    end
    it("saves objects in the database and returns an array of all books currently stored") do
      book1 = Book.new({:title => "The Sign of Three", :id => nil})
      book1.save()
      book2 = Book.new({:title => "Hound of the Baskervilles", :id => nil})
      book2.save()
      expect(Book.all).to(eq([book2, book1]))
    end
  end

  describe('#==') do
    it('compares the attributes and declares two objects equal') do
      book1 = Book.new({:title => "The Sign of Three", :id => nil})
      book2 = Book.new({:title => "The Sign of Three", :id => nil})
      expect(book1).to(eq(book2))
    end
  end

  describe('.clear') do
    it('clears all books') do
      book1 = Book.new({:title => "The Sign of Three", :id => nil})
      book1.save()
      book2 = Book.new({:title => "Hound of the Baskervilles", :id => nil})
      book2.save()
      Book.clear()
      expect(Book.all()).to(eq([]))
    end
  end

  describe('.find') do
    it ('will find a book based on an id') do
      book1 = Book.new({:title => "The Sign of Three", :id => nil})
      book1.save()
      book2 = Book.new({:title => "Hound of the Baskervilles", :id => nil})
      book2.save()
      expect(Book.find(book1.id)).to(eq(book1))
    end
  end

  describe('.update') do
    it ('updates the attributes of a book') do
      book1 = Book.new({:title => "The Sign of Three", :id => nil})
      book1.save()
      book1.update("The Sign of Seven")
      expect(book1.title).to(eq("The Sign of Seven"))
    end
  end

end
