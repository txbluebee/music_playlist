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

get('/add_playlist') do
  erb(:add_new_playlist)
end

post('/playlist_form') do
  playlist_name = params.fetch('playlist')
  @new_playlist = Playlist.new(playlist_name)
  @new_playlist.save()
  erb(:success)
end
