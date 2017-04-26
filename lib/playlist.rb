class Playlist

  @@playlists = []

  def initialize(name)
    @name = name
    @id = @@playlists.length() + 1
    @songs = []
  end

  def name
    @name
  end

  def self.all
    @@playlists
  end

  def self.clear
    @@playlists = []
  end

  def save
    @@playlists.push(self)
  end

  def id
    @id
  end

  def self.find(id)
    found_playlist = nil
    @@playlists.each() do |playlist|
      if playlist.id() == id.to_i()
        found_playlist = playlist
      end
    end
    found_playlist
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs.push(song)
  end
end
