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

