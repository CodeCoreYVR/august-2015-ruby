# Rails Review
Let's create a new Rails app, and review routes, controllers, and [ActiveRecord](http://guides.rubyonrails.org/active_record_querying.html).  
  
```sh
rails new routes_controllers_and_active_record -T -d postgresql
cd routes_controllers_and_active_record
mv README.rdoc README.md
```
We just created an app without any tests that uses PostgreSQL for its database. We also decided to use markdown isntead of rdoc for our README.  
  
Now, let's start out by creating a root route, a `/contacts` route to handle GET requests, and a `/contacts` route to handle POST requests.  
  
## Routes
```ruby
# config/routes.rb
Rails.applicatoin.routes.draw do
  # get "/" => "home#lol"
  root "home#lol"
  get "/contacts" => "contacts#new"
  post "/contacts" => "contacts#create"
end
```
Now, if we want to check out our app to make sure that the routes are working, we'll need to first run `bin/rake db:create` to create our database. Then, we can run `bin/rails server` and checkout [localhost:3000](http://localhost:3000/rails/info/routes).  
  
## Controllers
We have a couple of options for creating our controllers. We could run
`bin/rails generate controller home_controller` which will create a
bunch of files for us
```
$ bin/rails generate controller home_controller
      create  app/controllers/home_controller_controller.rb
      invoke  erb
      create    app/views/home_controller
      invoke  helper
      create    app/helpers/home_controller_helper.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/home_controller.coffee
      invoke    scss
      create      app/assets/stylesheets/home_controller.scss
```
Or, we could just create our controller manually. Either way, we are going to want to add a `lol` action to handle our root route.
```ruby
# app/controllers/home_controller.rb

class HomeController < ApplicationController
  def lol
  end
end
```
Because we have inherited from the ApplicationController, Rails will see the empty action `lol` and look for a `lol` file under `app/views/home/`, so let's make sure if finds one.
```sh
mkdir app/views/home
touch app/views/home/lol.html.erb
```
```erb
<% # app/views/home/lol.html.erb %>
<h1>LOL</h1>
```
Let's add site navigation! Open up the application layout and add a couple of links for [home](http://localhost:3000) and [contacts](http://localhost:3000/contacts).
```erb
<% # app/views/layouts/application.html.erb %>
<!DOCTYPE html
<html>
<head>
  <title>RoutesControllersAndActiveRecord</title>
  <%= stylesheet_link_tag    'application', media: 'all',
'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' =>
true %>
  <%= csrf_meta_tags %>
</head>
<body>
  <%= link_to "home", root_path %> | 
  <%= link_to "new contact", contacts_path %>
  <%= yield %>
</body>
</html>
```
Great! Now that we have some links, we can navigate! But, we don't have a contacts controller, yet. So, let's make one.
```ruby
# app/controllers/contacts_controller.rb

class ContactsController < ApplicationController
  def new
    render text: "Make a new contact!"
  end

  def create
    render text: "Thanks for creating a new contact"
  end
end
```
## ActiveRecord
Let's go ahead and create a Contact model. We can use rails to generate it for us. Notice how `rails generage model contact name:string email_address:string` creates a model file and a migration for us?  
  
The model is quite simple looking, as its methods are inherited from `ActiveRecord::Base`
```ruby
class Contact < ActiveRecord::Base
end
```
The migration file has all the information needed to create the contacts table in the database. We will need to run a `bin/rake db:migrate` to make this happen.
```ruby
class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email_address

      t.timestamps null: false
    end
  end
end
end
```
You'll notice that before running `bin/rake db:migrate`, we do not have a `db/schema.rb` file. Go ahead and run your migration, then checkout what the schema file looks like.  
  
The schema file is the recipe for creating your app's database!
