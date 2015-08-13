class TestAttrMethods

  def initialize(a, b="Hello", c="Bonjour!")
    @a, @b, @c = a, b, c
  end

  attr_reader   :a
  attr_accessor :b
  attr_writer   :c

  def greetings
    puts "#{a} #{b} #{@c}"
  end

end
