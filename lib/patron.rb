require 'pry'

class Patron

  attr_accessor :name, :phone, :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @phone = attributes.fetch(:phone)
  end

  def self.all
    returned_patrons = DB.exec("SELECT * FROM patrons ORDER BY name;")
    patrons = []
    returned_patrons.each() do |patron|
      name = patron.fetch("name")
      phone = patron.fetch("phone")
      id = patron.fetch("id").to_i
      patrons.push(Patron.new({:name => name, :phone => phone, :id => id}))
    end
    patrons
  end

  def ==(patron_to_compare)
    self.name() == patron_to_compare.name
  end

  def save
    result = DB.exec("INSERT INTO patrons (name, phone) VALUES ('#{@name}', '#{@phone}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.clear
    DB.exec("DELETE FROM patrons *;")
  end

  def self.find(id)
    patron = DB.exec("SELECT * FROM patrons WHERE id = #{id};").first
    name = patron.fetch("name")
    phone = patron.fetch("phone")
    id = patron.fetch("id").to_i
    Patron.new({:name => name, :phone => phone, :id => id})
  end

  def update(name, phone)
    DB.exec("UPDATE patrons SET name = '#{name}' WHERE id = #{id};")
    DB.exec("UPDATE patrons SET phone = '#{phone}' WHERE id = #{id};")
  end

  def delete
    DB.exec("DELETE FROM patrons WHERE id = #{id}")
  end

end#class
