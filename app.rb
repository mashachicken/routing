require('sinatra')
require('sinatra/reloader')
require('./lib/album')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
   binding.pry
  @albums = Album.all
  erb(:albums)
end

get('/test') do
  @something = "this is a variable"
  erb(:whatever)
end


get('/') do
  "This will be our home page. '/' is always the root route in a Sinatra application."
end

get('/albums') do
  "This route will show a list of all albums."
end

get('/albums/new') do
  "This will take us to a page with a form for adding a new album."
  erb(:new_album)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end
#
# post('/albums') do
#   "This route will add an album to our list of albums. We can't access this by typing in the URL. In a future lesson, we will use a form that specifies a POST action to reach this route."
# end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name])
  @albums = Album.all
  erb(:albums)
end

delete('/albums/:id') do
  delete('/albums/:id') do
    @album = Album.find(params[:id].to_i())
    @album.delete()
    @albums = Album.all
    erb(:albums)
  end
end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end

post('/albums') do
  name = params[:album_name]
  album = Album.new(name, nil)
  album.save()
  @albums = Album.all() # Adding this line will fix the error.
  erb(:albums)
end
