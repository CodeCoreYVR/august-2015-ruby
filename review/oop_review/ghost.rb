class Ghost
  attr_reader :color
  def initialize
    @color = %w!red blue yellow pink!.sample
  end
end
