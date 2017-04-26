require('rspec')
require('song')

describe(Song) do
  before() do
    Song.clear()
  end

  describe('#artist') do
    it('returns the name of the artist') do
      test_song = Song.new('Coldplay','Yellow','rock')
      expect(test_song.artist()).to(eq('Coldplay'))
    end
  end

  describe('#song') do
    it('returns the name of the song') do
      test_song = Song.new('Coldplay','Yellow','rock')
      expect(test_song.song()).to(eq('Yellow'))
    end
  end

  describe('#genre') do
    it('returns the name of the genre') do
      test_song = Song.new('Coldplay','Yellow','rock')
      expect(test_song.genre()).to(eq('rock'))
    end
  end

  describe('.all') do
    it('returns all the songs') do
      expect(Song.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the song into the songs array') do
      test_song = Song.new('Coldplay','Yellow','rock')
      test_song.save()
      expect(Song.all()).to(eq([test_song]))
    end
  end

  describe('#id') do
    it('returns the id') do
      test_song = Song.new('Coldplay','Yellow','rock')
      test_song.save()
      expect(test_song.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('finds the song based on song id') do
      test_song = Song.new('Coldplay','Yellow','rock')
      test_song.save()
      expect(Song.find(test_song.id())).to(eq(test_song))
    end
  end
end
