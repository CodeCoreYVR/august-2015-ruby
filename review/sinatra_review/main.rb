require 'sinatra'
require 'json'

set :port, 3000
enable :sessions

get '/' do
  session[:song_list] = {} unless session[:song_list]
  erb :form
end

post '/songs' do
  session[:song_list][params[:title]] = params[:link]
  @songs = session[:song_list]
  erb :songs
end

get '/songs' do
  session[:song_list].to_json
end
