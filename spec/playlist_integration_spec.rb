require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the playlist path', {:type => :feature}) do
  it('displays the list of added playlists after user submits the form') do
    visit('/add_playlist')
    fill_in('playlist', :with => 'Work Out')
    click_button('Add Playlist')
    visit('/playlists')
    expect(page).to have_content('Work Out')
  end
end
