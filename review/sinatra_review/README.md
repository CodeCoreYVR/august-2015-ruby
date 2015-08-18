# Sinatra Review
Let's create a Sinatra web app! Woo hoo!!!  
  
Our app is going to have 2 views. One for inputing songs (song name, and YouTube link). And another to display all the songs we have.  
  
Since we haven't talked much about databases, and we haven't implemented classes in Sinatra, we'll keep things simple by storing our songs in a hash.  
  
Let's create a main app file that requires Sinatra, and just to make sure everything works, let's just put some text out there.
```ruby
# main.rb
require 'sinatra'

get '/' do
  "Hello everyone!"
end
```
Now that we are confident that our app is working, let's continue and add a view to put our form on.
```erb
<% # views/form.erb %>

Hello from the form view!
```
```ruby
# main.rb

get '/' do
  erb :form
end
```
Everything is working great, so let's go ahead and build out our form.
```erb
<% # views/form.erb %>

<form method="post" action="/songs">
  title: <input name="title"><br>
  YouTube link: <input name="link"><br>
  <input type=submit" value="add song">
</form>
```
Let's now add a "/songs" action to hand post requests.
```ruby
# main.rb

require 'sinatra'
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
```
And a view to render them
```erb
<% # views/songs.erb %>

<h1>My Favorite Songs</h1>

<ul>
  <% @songs.each do |title, link| %>
    <li><a href="<%= link %>"><%= title %></a></li>
  <% end %>
</ul>
```
