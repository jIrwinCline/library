require 'spec_helper'

describe '#Author' do

  describe('#Author') do
    it('creates an Author object and accurately stores the properties and new id') do
      author1 = Author.new({:name => 'Harry Stone', :id => 1})
      expect(author1.name).to(eq('Harry Stone'))
      expect(author1.id).to(eq(1))
    end
  end

  describe('.all') do
    it("returns and empty array where there are no authors") do
      expect(Author.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an Author") do
      author1 = Author.new({:name => 'Harry Stone', :id => nil})
      author1.save()
      expect(Author.all())
    end
  end

  describe('#==') do
    it('compares the attributes and declares two objects equal') do
      author1 = Author.new({:name => 'Harry Stone', :id => nil})
      author2 = Author.new({:name => 'Harry Stone', :id => nil})
      expect(author1).to(eq(author2))
    end
  end
  describe('.clear') do
    it('clears all authors') do
      author1 = Author.new({:name => 'Harry Stone', :id => nil})
      author1.save()
      author2 = Author.new({:name => 'Stony Harris', :id => nil})
      author2.save()
      Author.clear()
      expect(Author.all()).to(eq([]))
    end
  end
  describe('.find') do
    it('finds author by id') do
      author1 = Author.new({:name => 'Harry Stone', :id => nil})
      author1.save()
      author2 = Author.new({:name => 'Stony Harris', :id => nil})
      author2.save()
      expect(Author.find(author1.id)).to(eq(author1))
    end
  end
  describe('.update') do
    it('updates property of selected author') do
      author1 = Author.new({:name => 'Harry Stone', :id => nil})
      author1.save()
      author1.update("Doug Stone")
      expect(author1.name).to eq("Doug Stone")
    end
  end


end
