class Album
  attr_reader :id, :name, :artist
  attr_accessor :name
  @@albums = {}
  @@total_rows = 0
  @@artist

  def initialize(name, id, artist)
    @name = name
    @id = id || @@total_rows += 1
    @artist = artist
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.artist)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name)
    self.name = name
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def delete()
    @@albums.delete(self.id)
  end
end
