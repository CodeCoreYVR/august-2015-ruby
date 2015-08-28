# Rails Review (CRUD)
## Getting started
Let's review CRUD (Create Read Update Destroy) by building out an app called `five_songs`
```
rails new five_songs -T -d postgresql
cd five_songs
```
## Add the Model
```
rails new song title:string video_link:text
bin/rake db:create db:migrate
```
Now that we have a model, we've created the database, and run the migration, we can hop into `rails console` and add some songs.
```
rails console
song = Song.new
song.title = "The Sun and the Moon"
song.video_link = "https://www.youtube.com/watch?v=UoWFJ690U6Ea"
song.id
=> nil
song.save
song.id
=> 1
```
Let's add a scope to our song model to get just the most recent five songs.
```ruby
class Song < ActiveRecord::Base
  scope :recent, ->(x) { order('updated_at ASC').limit(x) }
  scope :recent_five, -> { order('updated_at ASC').limit(5) }

  def self.recent(x)
    order('updated_at ASC').limit(x)
  end
end
```
## Add Gems
Open up the Gemfile and let's add bootstrap-sass and hirb.
``` ruby
# Gemfile

# ...
gem 'bootstrap-sass', '~> 3.3.5'
gem 'hirb'
# ...
```
Then run `bundle install` to install the gems and add a scss file for importing bootstrap.
```scss
// app/assets/stylesheets/bootstrap_and_css_overrides.scss
@import 'bootstrap'
```
## Add some Views
Let's add the two (actually four) view files that we are going to use: `app/views/songs/index.html.erb`, `app/views/songs/new.html.erb`  
  
Our index view is going to list the 5 most recently added or updated songs.
```erb
<% # app/views/songs/index.html.erb %>
<table class="table table-striped">
  <tr>
    <th>Title</th>
    <th>Video Link</th>
  </tr>
    <% @songs..each do |song| %>
      <tr>
        <td><%= song.title %></td>
        <td><%= link_to "#{song.title}", song.video_link %><td>
      </tr>
    <% end %>
</table>
```
## Routes
If we add `resources :songs` to our routes file, it adds a bunch of routes for us.  
  
Let's just add a route to view our songs index.
```ruby
root "songs#index"
resources :songs, only: [:index]
```

## Controller
Now that we have a model and a view, we need a controller to serve up the view
```ruby
# app/controllers/songs_controller.rb

class SongsController < Application_Controller
  def index
    @songs = Song.recent_five
  end
end
```
## Add New Songs
We want to be able to add new songs. To do this, we'll need a route, controller actions for new and create, and a view with a form.  
  
Let's start by adding `:new`, and `:create` to our routes resource
```ruby
# config/routes.rb

# ...
  resources :songs, only: [:index, :new, :create]
# ...
```
Let's add the new, and create actions our controller before working on the form view.
```ruby
# app/controllers/songs_controller.rb

class SongsController < ApplicationController
  def index
    @songs = Song.recent_five
  end

  def new
    @song = @Song.new
  end

  def create
    @song = Song.new(params.require(:song).permit([:title, :video_link]))
    if @song.save
      redirect_to :songs_path
    else
      render :new
    end
  end
end
```
And a view with a form.
```erb
<% # app/views/songs/new.html.erb %>

<h1>Add a Song</h1>

<%= form_for @song do |f| %>
  <div class="form-group">
    <%= f.label :title %>
    <%= f.text_field :title, class: "form-control" %>
  </div>
  <div class="form-group">
    <%= f.label :video_link %>
    <%= f.text_field :video_link, class "form-controller" %>
  </div>
  <%= f.submit class: "btn btn default" %>

<% end %>
```
## One to Many (Albums have many Songs)
Let's add an album model that `has_many` songs. This means, we are going to change songs to `belong_to` albums.  
  
We'll start out by creating a new branch for our new feature work, and generating a model
  
```shell
git checkout -b add-feature-albums
rails generate model album name:string
```
Open up the album model and add the `has_many :songs` relation
```ruby
class Album < ActiveRecord::Base
  has_many :songs
end
```
Then run a `bin/rake db:migrate`, and let's think about the next migration we want to make.  
  
We want to add a new column to our songs table to store `album_id`.  
  
```shell
rails generate migration add_album_references_to_songs album:references
```
And migrate the changes with `bin/rake db:migrate`  
  
Don't forget to add `belongs_to :album` to your song model
```ruby
# app/models/song.rb

class Song < ActiveRecord::Base
  belongs_to :album

  scope :recent_five, -> { order('created_at DESC').limit(5) }
end
```
