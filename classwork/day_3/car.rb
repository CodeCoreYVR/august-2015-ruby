class Car

  def initialize(brand, model, capacity)
    # @model    = model
    # @capacity = capacity
    # @brand    = brand
    @model, @capacity, @brand = model, capacity, brand
  end

  def self.max_speed
    200
  end

  def drive(to_speed)
    @speed = to_speed
    "You're Driving.."
  end

  def stop
    puts pump_gas
    "You've stopped from speed #{@speed}"
  end

  def park
    "You've Parked"
  end

  private

  def pump_gas
    "You're pumping gas"
  end

  def ignite_engine
    "You're turning the car on"
  end
end
