require 'pry'
require 'fileutils'
require 'pry'

  class Class_name
    def initialize()

    end
    def method

    end
  end

#     class Album
#   attr_reader :id
#   attr_accessor :name, :year, :artist, :genre
#
#   @@albums = {}
#   @@total_rows = 0
#
#   def initialize(name,year,artist,genre, id)
#     @name = name
#     @year = year
#     @artist = artist
#     @genre = genre
#     # @songs = []
#     @id = id || @@total_rows += 1 #ask about this
#   end
#
#   def self.all()
#     @@albums.values()
#   end
#
#   def self.find(id)
#     @@albums[id]
#   end
#
#   def self.search(query)
#     @@albums.values.select { |album| album.name == query }
#   end
#
#   def self.sort
#     @@albums.values.sort
#   end
#
#   def self.clear
#     @@albums = {}
#     @@total_rows = 0
#   end
#
#   def save
#     @@albums[self.id] = Album.new(self.name,self.year, self.artist,self.genre, self.id)
#   end
#
#   def ==(album_to_compare)
#     self.name() == album_to_compare.name()
#   end
#
#   def update(name)
#     self.name = name
#     @@albums[self.id] = Album.new(self.name,self.year, self.artist,self.genre, self.id)
#   end
#
#   def delete
#     @@albums.delete(self.id)
#   end
#
#   def songs
#     Song.find_by_album(self.id)
#   end
#
# end

    