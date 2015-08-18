require "./ball.rb"
require "./ghost.rb"
require "./pacman.rb"

def start
  @pacman = Pacman.new
  @regular_ball = Ball.new
  @super_ball = Ball.new("super")
  @ghost = Ghost.new
end

start

puts "We are starting"
2.times do
  @pacman.eat_ghost @ghost
  puts "You have #{@pacman.lives} lives"
end

@pacman.eat_ball @super_ball
100.times { print "SUPER TIME: #{@pacman.super_time}" }

2.times { @pacman.eat_ghost @ghost }

10.times do
  @pacman.eat_ball @regular_ball
  puts "SUPER TIME: #{@pacman.super_time}"
end

puts "You have #{@pacman.lives} lives left."
@pacman.eat_ghost @ghost
