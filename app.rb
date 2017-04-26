require('sinatra')
require('sinatra/reloader')
require('./lib/playlist')
require('./lib/song')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/playlists') do
  @playlists = Playlist.all()
  erb(:show_playlists)
end

post('/playlist_form') do
  playlist_name = params.fetch('playlist')
  @playlist = Playlist.new(playlist_name)
  @playlist.save()
  @playlists = Playlist.all()
  erb(:show_playlists)
end

get('/playlist/:id') do
  playlist_id = params.fetch('id').to_i()
  @playlist = Playlist.find(playlist_id)
  @songs = @playlist.songs()
  erb(:playlist)
end

get('/playlist/:id/songs/new') do
  playlist_id = params.fetch('id').to_i()
  @playlist = Playlist.find(playlist_id)
  erb(:add_new_song)
end

post('/song_form') do
  artist = params.fetch('artist')
  song = params.fetch('song')
  genre = params.fetch('genre')
  @new_song = Song.new(artist, song, genre)
  @new_song.save()
  @playlist = Playlist.find(params.fetch('playlist_id').to_i())
  @playlist.add_song(@new_song)
  @songs = @playlist.songs()
  erb(:playlist)
end
