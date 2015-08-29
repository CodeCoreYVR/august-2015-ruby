# Rails Review (One to Many)
Let's create a new rails app to practice one to many relations.
```
rails new one_to_many -T -d postgresql
cd one_to_many
```  
  
Let's think about hotels and guests. We might think about the types of queries we're going to want to perform.  
  
For example, can we find all guests who stayed in a particular hotel? What about all hotels a particular guest has stayed in?  
  
What other queries might we want to perform?  
  - When a guest stayed at a hotel?
  - Most popular dates/peak seasons
  - Hotel prices
  - Length of stay

Does it make more sense to have a `guest_id` column in the hotels table, or a `hotel_id` column in the guests table?  
  
Let's look at our two main queries and think about what they might actually be.
```
Hotel.where("guest_id = ?", 5)
Guest.where("hotel_id = ?" 1)
```
Hmm... If we choose one, how would the other look? For example, if we say that hotels have a `guest_id` (meaning, hotels _belong to_ guests), how do we find all guests who stayed at a particular hotel?  
  
```
???
```
Now, what if we choose the other way, guests _belong to_ hotels. How would we perform that same query?
```
hotel = Hotel.last
hotel.guests
```
Let's try with the other query. How would we query 'all hotels a particular guest has stayed in?  
  
If we don't have a `guest_id` field in hotels, which makes sense, because how would other hotels keep track of a guest's id? Maybe by guest email address? Sure, but we could just use `hotel_id`.
```
Guest.where("hotel_id = ?", 1)
```
Let's build it out and play around with it.
```
rails generate resource hotel name:string location:string rooms:string
rails generate resource guest name:string email:string hotel:references
```
Open up the hotel model, and add `has_many :guests`
```
# app/models/hotel.rb
class Hotel < ActiveRecord::Base
  has_many :guests
end
```
and run `bin/rake db:create db:migrate`  
  
Now that we have a one to many relation in our database, let's hop into `bin/rails console` and make some records!
```
bin/rails console
Hirb.enable

Hotel.create(name: "Hyatt", location: "Vancouver", rooms: "300")
hotel = Hotel.last
guest = hotel.guests.new # because guests belong to hotels
guest.name = "Brady"
guest.email = "brady@gmail.com"
guest.save
```
Cool. Now, let's think about the front end. What routes do we want to have? We should be able to create and view hotels. Since guests belong to hotel, we should be able to add hotel guests.  
  
Let's add index, new, and create routes, controller actions, and appropriate views.
```
# config/routes.rb
Rails.application.routes.draw do
  root "hotels#index"
  resources :hotels, only: [:index, :new, :create]
end
```
This gives us the routes we need to view all hotels, and create a hotel. Let's add the controller and views!
```
# app/controllers/hotels_controller.rb
class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel.new(params.require(:hotel).permit([:name, :location, :rooms]))
    if @hotel.save
      redirect_to root_path
    else
      render :new
    end
  end
end
```
Now, we need to create a couple of views for new, and index. Let's start with the index view.
```erb
<% # app/views/hotels/index.html.erb %>
<h1>All Hotels</h1>

<ul>
  <% @hotels.each do |hotel| %>
    <li><%= hotel.name %>, <%= hotel.location %>, <%= hotel.rooms %></li>
  <% end %>
</ul>
```
And let's add a form to create new hotels
```
<% # app/views/hotels/new.html.erb %>

<h1>Add a New Hotel</h1>

<%= form_for @hotel do |f| %>
  <%= f.label :name %>
  <%= f.text_field :name %><br>
  <%= f.label :location %>
  <%= f.text_field :location %><br>
  <%= f.label :rooms %>
  <%= f.text_field :rooms %><br>
  <%= f.submit %>
<% end %>
```
Now, let's take a moment to think about adding guests. Where do we want to add them? What should that look like? Where should we put the form?  
  

First, add a show route for hotels to your routes file
```ruby
Rails.application.routes.draw do
  root "hotels#index"
  resources :hotels, only: [:index, :new, :create, :show]
end
```
Instantiate the hotel in o show action in the hotels controller
```
# app/controller/hotels_controller.rb
class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(params.require(:hotel).permit([:name, :location, :rooms]))
    if @hotel.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
  end
end
```
Let's add a show view for Hotels. From that view, we should be able to 'add new guests'.
```erb
<% # app/views/hotels/show.html.erb %>

<h1><%= @hotel.name %></h1>
<p><%= @hotel.location %>, rooms: <%= @hotel.rooms %>

<h2>Guests</h2>
<hr>
<%= link_to "add guest", "" %>
<% @hotel.guests.each do |guest| %>
  <%= guest.name %>
<% end %>
```
Let's add links to create a new hotel, view each hotel, and create guests on the hotel show pages.  
  
Take a moment to think about each of these links, and _where_ they
should live.  
  
Let's start with the "new hotel" link. We may want to create a new hotel from anywhere on the site, so it makes sense to add it to the application layout.
```
<% # app/views/layouts/application.html.erb %>

<!DOCTYPE html>
<html>
<head>
  <title>OneToMany</title>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
</head>
<body>
  <%= link_to "home", root_path %>
  <%= link_to "new hotel", new_hotel_path %>

  <%= yield %>

</body>
</html>
```
 Where would it make the most sense to have links to each of the hotels? If we look at our [rails routes](http://localhost:3000/rails/info/routes), we can see a `hotel_path` helper method that takes an `:id` as a parameter. This is a hint.
```erb
<% # app/views/hotels/index.html.erb %>

<h1>All Hotels</h1>

<ul>
  <% @hotels.each do |hotel| %>
    <li><%= link_to hotel.name, hotel_path(hotel.id) %>, <%= hotel.location %>, <%= hotel.rooms %></li>
  <% end %>
</ul>
```
*note*: we could also have written our link to like this:
```ruby
link_to hotel.name, hotel
```
