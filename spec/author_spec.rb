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

end
