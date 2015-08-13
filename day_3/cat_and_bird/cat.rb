require "./animal.rb"

class Cat < Animal

  def catch(prey)
    if rand(100) - prey.dodge >= 0
      @grab = prey
      puts "The cat #{name} caught #{prey.name}"
    end
  end

  def eat
    if @grab
      puts "Yum"
      @grab = nil
    else
      puts "Don't have a bird"
    end
  end

end
