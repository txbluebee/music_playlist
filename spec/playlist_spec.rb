require('rspec')
require('playlist')
require('song')

describe(Playlist) do
  before() do
    Playlist.clear()
  end

  describe('#name') do
    it('returns the name of the playlist') do
      test_playlist = Playlist.new('Work Out')
      expect(test_playlist.name()).to(eq('Work Out'))
    end
  end

  describe('.all') do
    it('returns all the playlists') do
      expect(Playlist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the playlist into the playlists array') do
      test_playlist = Playlist.new('Work Out')
      test_playlist.save()
      expect(Playlist.all()).to(eq([test_playlist]))
    end
  end

  describe('#id') do
    it('returns the playlist id') do
      test_playlist = Playlist.new('Work Out')
      test_playlist.save()
      test_playlist2 = Playlist.new('Study')
      test_playlist2.save()
      expect(test_playlist2.id()).to(eq(2))
    end
  end

  describe('.find') do
    it('finds the playlist based on the playlist id') do
      test_playlist = Playlist.new('Work Out')
      test_playlist.save()
      expect(Playlist.find(test_playlist.id())).to(eq(test_playlist))
    end
  end

  describe('#songs') do
    it('returns the songs in the playlist') do
      test_playlist = Playlist.new('Work Out')
      expect(test_playlist.songs()).to(eq([]))
    end
  end

  describe('#add_song') do
    it('adds song to the playlist songs array') do
      test_playlist = Playlist.new('Favorites')
      test_song = Song.new('Coldplay','Yellow','rock')
      test_playlist.add_song(test_song)
      expect(test_playlist.songs()).to(eq([test_song]))
    end
  end

end
