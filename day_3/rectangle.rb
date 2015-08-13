class Rectangle
  def initialize(width, height)
    @width, @height = width, height
  end

  attr_accessor :width
  attr_accessor :height

  def area
    # @width * @height
    width * height
  end

end

class Rectangle

  def info
    "I'm a Rectangle"
  end

end
