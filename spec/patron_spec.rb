require 'spec_helper'

  describe('#Patron') do
    describe('#Patron') do
      it('create a patron object with accurate properties') do
        patron = Patron.new({:name => "Tod Stone", :phone => "503-867-5309", :id => 1})
        expect(patron.name).to(eq("Tod Stone"))
        expect(patron.phone).to(eq("503-867-5309"))
        expect(patron.id).to(eq(1))
      end
    end

    describe('.all') do
      it("returns and empty array where there are no patrons") do
        expect(Patron.all).to(eq([]))
      end

      it("saves objects in the database and returns an array of all patron currently stored") do
        patron1 = Patron.new({:name => "Little Diggy", :phone => "503-777-7777", :id => nil})
        patron1.save()
        patron2 = Patron.new({:name => "Greg Mann", :phone => "503-777-7777", :id => nil})
        patron2.save()
        expect(Patron.all).to(eq([patron2, patron1]))
      end
    end

    describe('#==') do
      it('compares two attributes of patrons and if the attributes are the same, so are the patrons') do
        patron1 = Patron.new(:name => "Greg Mann", :phone => "541-710-5277", :id => nil)
        patron2 = Patron.new(:name => "Greg Mann", :phone => "541-710-5277", :id => nil)
        expect(patron1).to(eq(patron2))
      end
    end

    describe('.clear') do
      it('clears all patrons') do
        patron1 = Patron.new(:name => "Greg Mann", :phone => "541-710-5277", :id => nil)
        patron1.save()
        patron2 = Patron.new({:name => "Little Diggy", :phone => "503-777-7777", :id => nil})
        patron2.save()
        Patron.clear()
        expect(Patron.all()).to(eq([]))
      end
    end

    describe('.find') do
      it('will find a patron based on their id') do
        patron1 = Patron.new(:name => "Greg Mann", :phone => "541-710-5277", :id => nil)
        patron1.save()
        patron2 = Patron.new({:name => "Little Diggy", :phone => "503-777-7777", :id => nil})
        patron2.save()
        expect(Patron.find(patron1.id)).to(eq(patron1))
      end
    end

    describe('.update') do
      it ('updates the attributes of patron') do
        patron1 = Patron.new(:name => "Greg Mann", :phone => "541-710-5277", :id => nil)
        patron1.save()
        patron1.update("Josh Winn")
        expect(patron1.name).to(eq("Josh Winn"))
      end
    end

  end#class
