class Pacman
  attr_accessor :lives, :super_time, :points
  def initialize
    @lives, @super_time, @points = 2, 0, 0
  end

  def eat_ball(ball)
    @super_time -= 1
    ball.ball_type == "super" ? @super_time = 10 : @points += 1
  end

  def eat_ghost(ghost)
    @super_time > 0 ? @points += 10 : die
  end

  private

  def die
    @lives > 0 ? @lives -= 1 : game_over
  end

  def game_over
    100.times { print "GAME OVER !!!!!!!!!!!!!" }
    puts "You got #{@points} points."
  end
end
