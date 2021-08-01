require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 5

  attr :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport is at full capacity' if full?

    fail "Plane is already at airport" if @planes.include?(plane)

    fail "Plane has already landed somewhere else" if plane.landed

    fail 'Weather is too bad' if stormy?

    @planes << plane
    plane.land
  end

  def full?
    @planes.length >= capacity
  end

  def stormy?
    weather.stormy?
  end

  def take_off(plane)
    fail 'Weather is too bad' if stormy?

    fail "this plane isn't at the airport" unless @planes.include?(plane)

    planes.delete(plane)
    plane.take_off
  end
end
