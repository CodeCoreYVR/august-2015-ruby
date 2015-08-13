# to define a class you use the `class` keyword
# class names must start with a capital letter - classes are treated
# as constants in Ruby.
# Naming convention for class names is CamelCase
class Cookie

  # this method is called when you create a new object:
  # c = Cookie.new(10, 20)
  def initialize(sugar_amount, flour_amount)
    @sugar_amount = sugar_amount
    @flour_amount = flour_amount
  end

  # this is a public method that returns the instance variable @sugar_amount
  # this is called a GETTER mehtod
  # def sugar_amount
  #   @sugar_amount
  # end
  attr_reader :sugar_amount

  # this is a public method that sets the instance variable @sugar_amount
  # this is called a SETTER method
  # def sugar_amount=(new_amount)
  #   @sugar_amount = new_amount
  # end
  attr_writer :sugar_amount

  # attr_reader :flour_amount
  # attr_writer :flour_amount
  attr_accessor :flour_amount

  # Playing with class variables
  # def set_color(color)
  #   @@color = color
  # end
  #
  # def show_color
  #   @@color
  # end

  # this defines an instance (or object) method called `bake`
  # this is a public method. This can be called:
  # c = Cookie.new
  # c.bake
  def bake
    "Baking the cookie"
  end

  def eat
    dip_in_milk
    puts "Eating the cookie"
  end

  # this defines a public class method.
  # this can be called by:
  # Cookie.info
  def self.info
    # you can only call class methods in here
    puts extra_info
    # calling dip_in_milk will give an error because it's a instance
    # method and not a class method
    # dip_in_milk
    "I'm a Cookie class"
  end

  private

  def self.extra_info
    puts "I'm a super cookie class"
  end

  def dip_in_milk
    "Dipping the cookie in milk"
  end

end
