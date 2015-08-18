require "./cookie.rb"

# We call Cookie the super class or parent class
# We call Oreo the sub class or the child class
class Oreo < Cookie
  attr_accessor :filling_type

  # this re-defines (or overrides) the method that came with
  # the Cookie class
  def bake
    puts "Baking the Oreo cookie"
    # super called a method with the same name in the parent class
    super
  end
end
