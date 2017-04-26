class Song
  attr_accessor(:artist, :song, :genre, :id)
  @@songs = []

  def initialize(artist, song, genre)
    @artist = artist
    @song = song
    @genre = genre
    @id = @@songs.length() + 1
  end

  def self.all
    @@songs
  end

  def save
    @@songs.push(self)
  end

  def self.clear
    @@songs = []
  end

  def self.find(id)
    found_song = nil
    @@songs.each() do |song|
      if song.id() == id.to_i()
        found_song = song
      end
    end
    found_song
  end
end
