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
