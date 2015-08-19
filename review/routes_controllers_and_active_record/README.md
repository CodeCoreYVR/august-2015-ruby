# Rails Review
Let's create a new Rails app, and review routes, controllers, and [ActiveRecord](http://guides.rubyonrails.org/active_record_querying.html).  
  
```sh
rails new routes_controllers_and_active_record -T -d postgresql
cd routes_controllers_and_active_record
mv README.rdoc README.md
```
We just created an app without any tests that uses PostgreSQL for its database. We also decided to use markdown isntead of rdoc for our README.  
  
Now, let's start out by creating a root route, a `/contacts` route to handle GET requests, and a `/contacts` route to handle POST requests.  
  
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
