class Dog
  # Screaming case, generally used for constants in classes
  # You can access this from the outside using this code:
  # Dog::MAX_BONE_CAPACITY
  MAX_BONE_CAPACITY = 3

  def initialize(color, type)
    @type, @color = type, color
    @bones        = []
  end

  def give(bone)
    if @bones.count >= MAX_BONE_CAPACITY
      puts "I have too many bones"
    else
      @bones << bone
    end
  end

  def eat
    if @bones.count == 0
      puts "I have no bones"
    else
      bone = @bones.pop
      puts "I ate a #{bone.size} bone."
    end
  end

end
