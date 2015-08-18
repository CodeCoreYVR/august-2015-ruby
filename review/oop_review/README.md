#My First README
Today, we are going to review some command line commands, git, and object oriented programming.  
  
This file is written in Markdown. Markdown is pretty easy, but I still
forget some of the syntax, sometimes... like how to make tables, and I
always need to look up how to insert images!  
  
Fortunately, Markdown is small, and we can reference a [cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).  
  
## Command Line Commands
We can also syntax highlight code in blocks using triple backticks.
```
pwd
ls
whoami
mkdir lol_dir
cd lol_dir
touch my_file.rb
rm my_file.rb
cd ..
rm -r lol_dir # use `rm -rf <dir-name>` if you want to forcibly, recursively, remove stuff.
```
## Git
We can use git to track revision history for our projects. Simply by typing `git init` within a directory, we are able to keep track of every change that happens!!! (and more...)  
  
Initialize a git repo
```
git init
git status
git add README.md
git commit -m "Add README file to my AWESOME REPO"
git add README.md
git commit -m "Add more info to my README"
```
Create a new repo on [github]() and add the remote to your git repo locally.
```
git remote add origin git@github.com:<your-user-name>/readme_and_oop.git
git remote --verbose
git push origin master
```
Save and commit any changes, and push up to origin master again.
```
git status
git add README
git commit -m "Add more info to README"
git push origin master
```
## Classes and OOP Review
In classical programming (OOP), constructors, getters, and setters are very common. Let's take a look at how they work. To do so, let's build out a class file for generating person objects.  
  
In ruby, we can create a class file by simply declaring something as a class, then we are able to instantiate objects of that class (that is, the constuctor method is assumed).
```ruby
class Person
end
```
This is the same as if we wrote a constructor method that takes no arguments, like so
```ruby
class Person
  # constructor
  def initialize
  end
end
```
If we want person objects to have attributes, such as a name, an email address, etc. we can either create them when we instantiate new objects, or after. Whatever arguments we decide to pass into the constructor will need to be provided when instantiating new objects, unless we have default values.  
  
Let's add name, and email address arguments, so that each new instance
of Person requires a name and an email address.
```ruby
class Person
  def initialize(name, email_address)
  end
end
```
It is pretty useless to have a method with required arguments, if we aren't doing anything with them, so let's save them in variables.
```ruby
class Person
  def initialize(name, email_address)
    name = name
    email_address = email_address
    puts "Hi. My name is #{name} and my email address is #{email_address}."
  end
end
```
If we want to return a person's name with a method call like `person_instance.name`, we have to create a method called `name`.
```ruby
class Person
  def initialize(name, email_address)
    @name, email_address = name, email_address
    puts "Hi. My name is #{name}, and my email address is #{email_address}."
  end

  def name
    @name
  end

end
```
Now, what if we want to change a person's name after the person object has been instantiated?
```ruby
class Person
  # constructor
  def initialize(name, email_address)
    @name = name
  end

  # attr_reader :name
  def name
    @name
  end

  # attr_writer :name
  def name=(new_name)
    @name = new_name
  end
end
```
### Pacman
Let's create a couple of classes. We want to think about objects and how they interact. A nice example might be Pacman eating balls, and ghosts.  
  
Think about what objects we might need, and how they might interact.  
  
We might want to have 3 classes:
  - Pacman
  - Ghost
  - Ball

Let's start with the Ball class. Ball objects should instantiate with a default type of 'regular', if no argument is passed.  

```ruby
class Ball
  attr_reader :ball_type
  def initialize(type='regular')
    @ball_type = type
  end
end
```
Now, think about Ghost. Ghosts can be red, blue, yellow, or pink. Let's instantiate ghosts without any arguments, and a random color among the 4 available.

```ruby
class Ghost
  attr_reader :color
  def initialize
    @color = %w!red blue yellow pink!.sample
  end
end
```
Think about the Pacman class, how it should instantiate, and what methods it should have. If you have some time, try to create it. We'll talk more on Saturday.
```ruby
class Pacman
  attr_accessor :lives, :super_time
  def initialize
    @lives, @super_time, @points = 2, 0, 0
  end

  def eat_ball(ball)
    @super_time -= 1
    ball.ball_type == "super" ? @super_time = 10 : @points += 1
  end

  def eat_ghost(ghost)
    @super_time > 0 ? @points += 10 : die
    @super_time -= 1
  end

  private

  def die
    @lives > 0 ? @lives -= 1 : game_over
  end

  def game_over
    100.times { print "GAME OVER!!!!!!!" }
    return "You got #{@points}"
  end
end
```

